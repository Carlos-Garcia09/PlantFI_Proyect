import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';

void main() {
  runApp(const FlowerRecognitionApp());
}

class FlowerRecognitionApp extends StatelessWidget {
  const FlowerRecognitionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FlowerRecognitionHome(),
    );
  }
}

class FlowerRecognitionHome extends StatefulWidget {
  const FlowerRecognitionHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FlowerRecognitionHomeState createState() => _FlowerRecognitionHomeState();
}

class _FlowerRecognitionHomeState extends State<FlowerRecognitionHome> {
  // ignore: unused_field
  late tfl.Interpreter _interpreter;
  // ignore: unused_field
  List<String> _labels = [];
  final picker = ImagePicker();
  late PickedFile _image = PickedFile('');

  

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    _interpreter = await tfl.Interpreter.fromAsset('assets/model.tflite');
    // Cargar etiquetas
    // _labels = ...; Carga tus etiquetas aquí.
    _labels = await FileUtil.loadLabels('assets/labels.txt');
  }

  Future<void> getImageFromGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = PickedFile(image.path);
        // Aquí llamamos a la función de inferencia con la imagen seleccionada.
        performInference(_image);
      }
    });
  }



  // Función para realizar la inferencia
  void performInference(PickedFile image) async {
  try {
    _interpreter = await tfl.Interpreter.fromAsset('assets/model.tflite');
    var input = [[1.23, 6.54, 7.81, 3.21, 2.22]]; // Reemplaza con tu entrada real
    var output = List.filled(1 * 2, 0).reshape([1, 2]); // Ajusta según tu salida real
    _interpreter.run(input, output);

    var input0 = [1.23]; // Ajusta según tus entradas reales
    var input1 = [2.43]; // Ajusta según tus entradas reales
    var inputs = [input0, input1, input0, input1]; // Ajusta según tus entradas reales
    var output0 = List<double>.filled(1, 0); // Ajusta según tu salida real
    var output1 = List<double>.filled(1, 0); // Ajusta según tu salida real
    var outputs = {0: output0, 1: output1}; // Ajusta según tu salida real
    _interpreter.runForMultipleInputs(inputs, outputs);

    _interpreter.close();

    // Cargar etiquetas
    _labels = await FileUtil.loadLabels('assets/labels.txt'); // Ajusta según la ruta de tu archivo de etiquetas

    // Mostrar los resultados en un diálogo emergente
    showInferenceDialog(_labels[0]);

  } catch (e) {
    if (kDebugMode) {
      print('Error al realizar la inferencia: $e');
    }
  }
}

void showInferenceDialog(String flowerLabel) {
  showDialog(
    context: _getContext(),
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Resultados de la detección'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('La flor detectada es: $flowerLabel'), // Ajusta según tu lógica de detección
              // Puedes agregar más detalles aquí si es necesario
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Aceptar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

BuildContext _getContext() {
  BuildContext? context;
  return context!;
}
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('PlanFI'),
      backgroundColor: Colors.green,
    ),
    body: Center(
      // ignore: unnecessary_null_comparison
      child: _image == null
          ? const Text('Selecciona una imagen')
          : Image.file(File(_image.path)),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: getImageFromGallery,
      tooltip: 'Seleccionar imagen',
      child: const Icon(Icons.add_a_photo),
    ),
  );
}

}

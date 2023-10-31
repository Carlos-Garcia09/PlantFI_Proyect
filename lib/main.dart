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



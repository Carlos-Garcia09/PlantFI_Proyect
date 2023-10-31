import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
<<<<<<< HEAD
=======

>>>>>>> f758f8a38ce4f986d03bef85c1c388a5b44d8726

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
<<<<<<< HEAD
  final picker = ImagePicker();
  late PickedFile _image = PickedFile('');

  

  @override
  void initState() {
    super.initState();
  }

  Future<void> getImageFromGallery() async {
    
  }
=======

>>>>>>> f758f8a38ce4f986d03bef85c1c388a5b44d8726

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('PlanFI'),
      backgroundColor: Colors.green,
    ),
<<<<<<< HEAD
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
=======
    ),
}

}



>>>>>>> f758f8a38ce4f986d03bef85c1c388a5b44d8726



import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


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


  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('PlanFI'),
      backgroundColor: Colors.green,
    ),
    ),
}

}






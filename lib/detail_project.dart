import 'package:flutter/material.dart';
class DetailsProject extends StatelessWidget {
  final String imagePath;

  const DetailsProject({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
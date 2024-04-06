import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ServiceDetailsPage extends StatelessWidget {
  final double? height;
  final String animationPath;
  final String title;
  final String infoText;

  const ServiceDetailsPage({
    Key? key,
    this.height,
    required this.animationPath,
    required this.title,
    required this.infoText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromRGBO(235, 235, 235, 1),
                ),
                child: Lottie.asset(animationPath, width: 300),
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromRGBO(235, 235, 235, 1),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        ///main text
                        child: Text(
                          infoText,
                          style: const TextStyle(fontSize: 18,),
                          textAlign: TextAlign.justify,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ),
                )),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

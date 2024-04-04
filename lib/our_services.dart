import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OurServices extends StatelessWidget {
  const OurServices({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromRGBO(3, 125, 214, 1);
    const backgroundColor = Color.fromRGBO(217, 217, 217, 1);
    const Color cardColor = Color.fromRGBO(235, 235, 235, 1);
    const TextStyle titleStyle = TextStyle(
      color: primaryColor,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontFamily: "CustomFont",
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Our Services:",
                          style: titleStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 500),
                              pageBuilder: (_, __, ___) => const ServiceDetailsPage(
                                animationPath: "assets/app.json",
                                title: "Mobile App",
                              ),
                              transitionsBuilder: (_, animation, __, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: cardColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child:
                                    Lottie.asset("assets/app.json", width: 200),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Mobile App',
                                style: titleStyle,
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 500),
                              pageBuilder: (_, __, ___) => const ServiceDetailsPage(
                                animationPath: "assets/web.json",
                                title: "Web Development",
                              ),
                              transitionsBuilder: (_, animation, __, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: cardColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child:
                                    Lottie.asset("assets/web.json", width: 200),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Web Development',
                                style: titleStyle,
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceDetailsPage extends StatelessWidget {
  final String animationPath;
  final String title;

  const ServiceDetailsPage({
    Key? key,
    required this.animationPath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Lottie.asset(animationPath, width: 300),
          SizedBox(height: 20),
          const Text(
            "Info",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

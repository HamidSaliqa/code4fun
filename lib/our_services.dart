import 'package:code4fun/service_details_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OurServices extends StatelessWidget {
  const OurServices({super.key});

  @override
  Widget build(BuildContext context) {
    const String textOfApp =
        '''Mobile apps can be built using various programming languages. In the realm of mobile app development, common languages include Java, Kotlin, Swift, and C#. However, other languages can also be used for mobile app development, such as C++, Python, and JavaScript.

In the realm of hybrid app development, which involves creating apps through the web using technologies like HTML, CSS, and JavaScript, popular frameworks include React Native and Flutter. These frameworks allow you to develop cross-platform mobile apps using web-based languages.

Ultimately, the choice of programming language for mobile app development depends on the type of app you want to build and your specific needs.''';

    const String textOfWeb =
        ''' Web Programming Languages: Common languages in web development include HTML (HyperText Markup Language), CSS (Cascading Style Sheets), and JavaScript. HTML is used for structuring and content of a website, CSS is used for visual design and appearance, and JavaScript is used for interactive programming.

Web Frameworks: Web frameworks are collections of tools and libraries that assist developers in building web applications. Some popular web frameworks in development include Django and Flask for Python, Ruby on Rails for Ruby, Express.js and Node.js for JavaScript, and Laravel for PHP.

Database: To store and manage website data, commonly used database management systems include MySQL, PostgreSQL, and MongoDB. These systems provide the capability to store and retrieve information. ''';
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
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              pageBuilder: (_, __, ___) =>
                                  const ServiceDetailsPage(
                                animationPath: "assets/app.json",
                                title: "Mobile App",
                                infoText: textOfApp,
                                    height: 0,
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
                              const SizedBox(height: 20),
                              const Text(
                                'Mobile App',
                                style: titleStyle,
                              ),
                              const SizedBox(height: 20),
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
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              pageBuilder: (_, __, ___) =>
                                  const ServiceDetailsPage(
                                animationPath: "assets/web.json",
                                title: "Web Development",
                                infoText: textOfWeb,
                                    height: 20,
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
                              const SizedBox(height: 20),
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


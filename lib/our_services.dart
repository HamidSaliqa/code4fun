import 'package:flutter/material.dart';

class OurServices extends StatelessWidget {
  const OurServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(12),

              ///main con
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
                        style:
                            TextStyle(fontFamily: "CustomFont", fontSize: 30),
                      ),
                    ),
                  ),

                  ///first Con
                  Expanded(
                    child: PageView(
                      children: [
                        ///page 1
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color.fromRGBO(235, 235, 235, 1),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Mobile App',
                                style: TextStyle(
                                    color: Color.fromRGBO(3, 125, 214, 1),
                                    fontSize: 24,
                                    fontFamily: "CustomFont",
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                    "Mobile apps are programs installed on mobile phones or tablets that provide various functionalities to users. These apps can include different types of applications, such as communication apps, media apps, games, business software, and more.",textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: "CustomFont",
                                        fontSize: 17)),
                              ),
                            ],
                          ),
                        ),

                        ///page 2
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color.fromRGBO(235, 235, 235, 1),
                          ),
                          child: Center(
                            child: Text(
                              'Page 2',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),

                        ///page 3
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color.fromRGBO(235, 235, 235, 1),
                          ),
                          child: Center(
                            child: Text(
                              'Page 3',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  ///second Con
                  Expanded(
                    child: PageView(
                      children: [
                        ///page 1
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color.fromRGBO(235, 235, 235, 1),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Web Development',
                                style: TextStyle(
                                    color: Color.fromRGBO(3, 125, 214, 1),
                                    fontSize: 24,
                                    fontFamily: "CustomFont",
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                    "Web development refers to the process of designing, building, and implementing websites and web applications. It involves various stages, including requirements analysis, user interface design, programming, testing, and deployment of the website or web application.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: "CustomFont",
                                        fontSize: 17)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color.fromRGBO(235, 235, 235, 1),
                          ),
                          child: Center(
                            child: Text(
                              'Page 2',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color.fromRGBO(235, 235, 235, 1),
                          ),
                          child: Center(
                            child: Text(
                              'Page 3',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

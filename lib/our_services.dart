import 'package:flutter/material.dart';

class OurServices extends StatelessWidget {
  const OurServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 217, 217, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
              child:  Column(
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
                  ///first Con
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: PageView(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Color.fromRGBO(235, 235, 235, 1),
                            ),
                            child: Center(
                              child: Text(
                                'Page 1',
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ///second Con
                  ///first Con
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: PageView(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Color.fromRGBO(235, 235, 235, 1),
                            ),
                            child: Center(
                              child: Text(
                                'Page 1',
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
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          )),

        ],
      ),
    );
  }
}

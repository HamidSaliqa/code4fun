import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WhoCanBenefit extends StatelessWidget {
  const WhoCanBenefit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 217, 217, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color.fromRGBO(245, 245, 245, 1),
                ),
                child:Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Who Can Benefit?",
                        style: TextStyle(
                            fontFamily: "CustomFont",
                            fontSize: 60,
                            color: Color.fromRGBO(3, 125, 214, 1)),
                      ),
                    ),

                    ///first con
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color.fromRGBO(3, 125, 214, 0.5),
                          ),
                          child: Center(
                            child: Text(
                              'Page 1',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    ),

                    ///read more button
                    SizedBox(
                      height: 65,
                      width: 350,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 6, 149, 203),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(34),
                            ),
                          ),
                        ),
                        onPressed: () {
                          launchUrlString('https://wassa.org.af/about/');
                        },
                        child: const Text(
                          "Read More",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: "CustomFont"
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class WhoCanBenefit extends StatefulWidget {
  const WhoCanBenefit({Key? key}) : super(key: key);

  @override
  _WhoCanBenefitState createState() => _WhoCanBenefitState();
}

class _WhoCanBenefitState extends State<WhoCanBenefit> {
  bool returneesExpanded = false;
  bool idpsExpanded = false;
  bool universityStudentsExpanded = false;
  bool schoolStudentsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Who Can Benefit?",
                      style: TextStyle(
                        fontFamily: "CustomFont",
                        fontSize: 60,
                        color: Color.fromARGB(255, 6, 149, 203),
                      ),
                    ),
                  ),

                  /// First Container
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: const Color.fromRGBO(3, 125, 214, 0.5),
                          boxShadow: const [
                            BoxShadow(
                              blurStyle: BlurStyle.inner,
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 4),
                              color: Colors.white,
                            )
                          ],
                        ),
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          children: [
                            const SizedBox(height: 70),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  returneesExpanded = !returneesExpanded;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    returneesExpanded
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "■ Returnees",
                                    style: TextStyle(
                                      fontFamily: "CustomFont",
                                      fontSize: 25,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (returneesExpanded)
                              const Column(
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    "Information for Returnees",
                                    style: TextStyle(
                                      fontFamily: "CustomFont",
                                      fontSize: 18,
                                      color: Colors.white
                                    ),
                                  ),
                                  // Add more information here
                                ],
                              ),
                            const SizedBox(height: 40),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  idpsExpanded = !idpsExpanded;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    idpsExpanded
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "■ IDPs",
                                    style: TextStyle(
                                      fontFamily: "CustomFont",
                                      fontSize: 25,
                                      color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (idpsExpanded)
                              const Column(
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    "Information for IDPs",
                                    style: TextStyle(
                                      fontFamily: "CustomFont",
                                      fontSize: 18,
                                        color: Colors.white
                                    ),
                                  ),
                                  // Add more information here
                                ],
                              ),
                            const SizedBox(height: 40),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  universityStudentsExpanded =
                                  !universityStudentsExpanded;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    universityStudentsExpanded
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "■ University students",
                                    style: TextStyle(
                                      fontFamily: "CustomFont",
                                      fontSize: 25,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (universityStudentsExpanded)
                              const Column(
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    "Information for University students",
                                    style: TextStyle(
                                      fontFamily: "CustomFont",
                                      fontSize: 18,
                                        color: Colors.white
                                    ),
                                  ),
                                  // Add more information here
                                ],
                              ),
                            const SizedBox(height: 40),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  schoolStudentsExpanded =
                                  !schoolStudentsExpanded;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    schoolStudentsExpanded
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "■ School students",
                                    style: TextStyle(
                                      fontFamily: "CustomFont",
                                      fontSize: 25,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (schoolStudentsExpanded)
                              const Column(
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    "Information for School students",
                                    style: TextStyle(
                                      fontFamily: "CustomFont",
                                      fontSize: 18,
                                        color: Colors.white
                                    ),
                                  ),
                                  // Add more information here
                                ],
                              ),
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
    );
  }
}
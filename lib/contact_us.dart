import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/round.png",
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  "Have Any\nQuestions ?",
                  style: TextStyle(fontFamily: "CustomFont", fontSize: 30),
                ),
              )),
          const SizedBox(
            height: 40,
          ),
          customRectengle(
              width: 260,
              child: const Text("+93728581122",
                  style: TextStyle(fontFamily: "CustomFont", fontSize: 20))),
          const SizedBox(
            height: 10,
          ),
          customRectengle(
              width: 300,
              child: const Text(
                "info@wassa.org.af",
                style: TextStyle(fontFamily: "CustomFont", fontSize: 20),
              )),
          const SizedBox(
            height: 10,
          ),
          customRectengle(
              width: 340,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(child: Image.asset("assets/twitter.png")),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(child: Image.asset("assets/telegram.png")),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(child: Image.asset("assets/instagram.png")),
                ],
              )),
        ],
      ),
    );
  }
}

Widget customRectengle({required double width, required Widget child}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      alignment: Alignment.center,
      height: 50,
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: Color(0xFF037DD6),
      ),
      child: child,
    ),
  );
}

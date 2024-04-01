import 'package:code4fun/widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
        body: Column(
          children: [
            SafeArea(
              child: Container(
                color: const Color.fromRGBO(3, 125, 214, 0.8),
                child: Row(
                  children: [
                    Image.asset("assets/wassalogo.png"),
                    SizedBox(width: 10,),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("WASSA",style: TextStyle(fontFamily: "CustomFont",fontSize: 20,color: Colors.white),),
                        Text("Woman Activity & Social service Association",style: TextStyle(color: Colors.white,fontFamily: "CustomFont",fontSize: 15),),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            Expanded(flex: 2, child: slider()),
            Expanded(
              flex: 3,
              child: customGridview(context),
            ),
          ],
        ));
  }
}

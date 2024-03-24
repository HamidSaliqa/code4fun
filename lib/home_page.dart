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
      backgroundColor: Color.fromRGBO(217, 217, 217, 1),
      appBar: AppBar(
        leading: Image.asset("assets/wassalogo.png"),

        title: Text('wassa',style:TextStyle(fontSize: 25),),
        backgroundColor: Color.fromARGB(255, 6, 149, 203),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
              child: slider()),
          Expanded(
            flex: 2,
            child: customGridview(context),
          ),
        ],
      )
    );
  }
}


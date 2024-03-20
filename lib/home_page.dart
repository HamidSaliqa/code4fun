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
    var libraryNames = ["About WASSA", "Our Services", "Who Can Benefit?","Student Project","Gallery","Contact"];
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 217, 217, 1),
      appBar: AppBar(
        title: Text('wassa',style: labelTextStyle,),
      ),
      body: Column(
        children: [
          Expanded(child: slider()),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(libraryNames.length, (index) {
                return CustomButton(
                  nameOfButton: libraryNames[index],
                  onPressed: () {},
                );
              }),
            ),
          ),
        ],
      )
    );
  }
}

class CustomButton extends StatelessWidget {
  final String nameOfButton;
  final VoidCallback onPressed;

  CustomButton({required this.nameOfButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(2, 2), blurRadius: 8)
      ]),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(21))),
            backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(3, 125, 214, 1))),
        onPressed: onPressed,
        child: Text(
          nameOfButton,style: TextStyle(fontFamily:"CustomFont",fontSize: 30),
        ),
      ),
    );
  }
}

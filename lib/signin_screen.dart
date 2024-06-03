import 'package:code4fun/push_data.dart';
import 'package:code4fun/reusable_widgets/reusable_widget.dart';
import 'package:code4fun/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _emailErrorTextController = TextEditingController();
  final TextEditingController _passwordErrorTextController = TextEditingController();
  bool _emailError = false;
  bool _passwordError = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.toNamed("/Home");
        return true;

      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("#62cff4"),
                hexStringToColor("#2c67f2"),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                logoWidget("assets/login.png"),
                  const SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter UserName", Icons.person_outline, false,
                      _emailTextController,_emailErrorTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      _passwordTextController, _passwordErrorTextController,),
                  const SizedBox(
                    height: 10,
                  ),
                  firebaseUIButton(context, "Sign In", () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                    )
                        .then((value) {
                      Get.toNamed("/PushData");
                    })
                        .onError((error, stackTrace) {
                      setState(() {
                        _emailErrorTextController.text = "Invalid email";
                        _passwordErrorTextController.text = "Invalid password";
                      });
                    });
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

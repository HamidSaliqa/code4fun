import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(alignment: AlignmentDirectional.center, children: [
                Image.asset(
                  "assets/round.png",
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    "assets/wassalogo.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ]),
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
            ),
          ),
          const Expanded(
            child: SizedBox(
              height: 40,
            ),
          ),
          Expanded(
            child: customRectengle(
              width: MediaQuery.of(context).size.width * 0.6,
              child: InkWell(
                child: const Text(
                  "+93728581122",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: "CustomFont",
                      fontSize: 20,
                      color: Colors.white),
                ),
                onTap: () {
                  showCallConfirmationDialog(context);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: customRectengle(
              width: MediaQuery.of(context).size.width * 0.7,
              child: InkWell(
                  child: const Text(
                    "info@wassa.org.af",
                    style: TextStyle(
                        fontFamily: "CustomFont",
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  onTap: () {
                    launchEmailApp();
                  }),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          customRectengle(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Image.asset(
                    "assets/twitter.png",
                    height: 35,
                    color: Colors.white,
                  ),
                  onTap: () {
                    launchUrlString('https://www.twitter.com/wassa.af/');
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  child: Image.asset(
                    "assets/telegram.png",
                    height: 35,
                    color: Colors.white,
                  ),
                  onTap: () {
                    launchUrlString('https://www.telegram.com/wassa.af/');
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  child: Image.asset(
                    "assets/instagram.png",
                    height: 35,
                    color: Colors.white,
                  ),
                  onTap: () {
                    launchUrlString('https://www.instagram.com/wassa.af/');
                  },
                ),
              ],
            ),
          ),
          const Expanded(
              child: SizedBox(
            height: 20,
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
      padding: EdgeInsets.only(left: 20),
      alignment: Alignment.centerLeft,
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

void launchEmailApp() async {
  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'info@wassa.org.af',
  );

  if (await canLaunch(_emailLaunchUri.toString())) {
    await launch(_emailLaunchUri.toString());
  } else {
    throw 'Could not launch email app';
  }
}

void launchPhoneApp() async {
  const String _phoneNumber = '+93728581122';
  final Uri _phoneLaunchUri = Uri(
    scheme: 'tel',
    path: _phoneNumber,
  );

  if (await canLaunch(_phoneLaunchUri.toString())) {
    await launch(_phoneLaunchUri.toString());
  } else {
    throw 'Could not launch phone app';
  }
}
void showCallConfirmationDialog(BuildContext context) {
  showPlatformDialog(
    context: context,
    builder: (_) => BasicDialogAlert(
      title: const Text('Make a Call'),
      content: const Text('Do you want to call +93 728 58 11 22?'),
      actions: <Widget>[
        BasicDialogAction(
          title: const Text("No"),
          onPressed: () {
          Navigator.pop(context);
          },
        ),
        BasicDialogAction(
          title: const Text("Yes"),
          onPressed: () {
            Navigator.pop(context);
            launchPhoneApp();
          },
        ),
      ],
    ),
  );
}

import 'package:code4fun/about_wassa,dart.dart';
import 'package:code4fun/contact_us.dart';
import 'package:code4fun/detail_project.dart';
import 'package:code4fun/gallery.dart';
import 'package:code4fun/home_page.dart';
import 'package:code4fun/our_services.dart';
import 'package:code4fun/push_data.dart';
import 'package:code4fun/service_details_page.dart';
import 'package:code4fun/login_screen.dart';
import 'package:code4fun/splash.dart';
import 'package:code4fun/student_project.dart';
import 'package:code4fun/who_can_benefit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA6Z68MhwsleeNizJdx7NQ601pkSNDGmbo",
            authDomain: "code4fun-61f1e.firebaseapp.com",
            databaseURL: "https://code4fun-61f1e-default-rtdb.firebaseio.com",
            projectId: "code4fun-61f1e",
            storageBucket: "code4fun-61f1e.appspot.com",
            messagingSenderId: "330824475481",
            appId: "1:330824475481:web:c7d95633b9531b57aa6248",
            measurementId: "G-B11921MGGV"
        ));

  } else {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/Splash",
      getPages: [
        GetPage(name:"/Splash", page:()=>SplashPage()),
        GetPage(name:"/", page:()=>const HomePage()),
        GetPage(name:"/About", page:()=>const AboutWassa_page()),
        GetPage(name:"/OurServices", page:()=>const OurServices()),
        GetPage(name:"/ServiceDetails", page:()=>const ServiceDetailsPage()),
        GetPage(name:"/WhoCanBenefit", page:()=>const WhoCanBenefit()),
        GetPage(name:"/StudentProject", page:()=>const StudentProject()),
        GetPage(name:"/DetailsProject", page:()=> DetailsProject()),
        GetPage(name:"/Gallery", page:()=>GalleryPage()),
        GetPage(name:"/ContactUs", page:()=>const ContactUs()),
        GetPage(name:"/PushData", page:()=> PushData()),
        GetPage(name:"/SignInScreen", page:()=>const LoginScreen()),



      ],
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

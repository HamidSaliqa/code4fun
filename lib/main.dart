import 'package:code4fun/about_wassa,dart.dart';
import 'package:code4fun/contact_us.dart';
import 'package:code4fun/detail_project.dart';
import 'package:code4fun/gallery.dart';
import 'package:code4fun/home_page.dart';
import 'package:code4fun/our_services.dart';
import 'package:code4fun/service_details_page.dart';
import 'package:code4fun/splash.dart';
import 'package:code4fun/student_project.dart';
import 'package:code4fun/who_can_benefit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        GetPage(name:"/DetailsProject", page:()=>const DetailsProject()),
        GetPage(name:"/Gallery", page:()=>GalleryPage()),
        GetPage(name:"/ContactUs", page:()=>const ContactUs()),



      ],
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

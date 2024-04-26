import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ServiceInfo {
  final String title;
  final String infoText;
  final String iconUrl;
  final String serviceKey; // اضافه کردن ویژگی serviceKey

  ServiceInfo({
    required this.title,
    required this.infoText,
    required this.iconUrl,
    required this.serviceKey, // اضافه کردن ویژگی serviceKey
  });
}

class ServiceDetailsPage extends StatefulWidget {
  final double? height;
  final String animationPath;
  final String title;
  final String infoText;

  const ServiceDetailsPage({
    Key? key,
    this.height,
    required this.animationPath,
    required this.title,
    required this.infoText,
  }) : super(key: key);

  @override
  State<ServiceDetailsPage> createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  bool isExpanded = false;
  int selectedServiceIndex = -1;
  Color fColorCon = const Color.fromRGBO(235, 235, 235, 1);

  List<ServiceInfo> serviceList = [
    ServiceInfo(
      title: "Flutter",
      infoText:
          "Flutter is a cross-platform framework developed by Google for building mobile applications. It allows developers to write code once and deploy it on multiple platforms, such as iOS and Android. Flutter uses the Dart programming language and provides a rich set of pre-built UI components, allowing for the creation of beautiful and responsive user interfaces. With Flutter, developers can create high-performance applications with a single codebase, saving time and effort in the development process.",
      iconUrl: "https://img.icons8.com/color/48/flutter.png",
      serviceKey: "flutter",
    ),
    ServiceInfo(
      title: "Java",
      infoText:
          "Java is an object-oriented programming language that can be executed on the Java platform and Java Virtual Machines (JVMs). It was developed by Sun Microsystems (now part of Oracle Corporation). Java is widely recognized as a popular programming language in the software industry and is used for developing a wide range of applications, including desktop, web, and mobile applications. It offers features such as platform independence, strong memory management, and extensive libraries, making it a versatile and powerful language for software development.",
      iconUrl: "https://img.icons8.com/dusk/64/java-coffee-cup-logo.png",
      serviceKey: "java",
    ),
    ServiceInfo(
      title: "C++",
      infoText:
          "C++ is a powerful, general-purpose programming language that was developed as an extension of the C programming language. It was created by Bjarne Stroustrup in the early 1980s. C++ combines the features of both procedural and object-oriented programming paradigms, allowing developers to write efficient and high-performance code. It provides low-level control over hardware resources and supports features such as classes, inheritance, polymorphism, and templates. C++ is widely used in areas such as game development, embedded systems, operating systems, and high-performance computing. Its versatility and performance make it a popular choice for developers who require fine-grained control over their code.",
      iconUrl: "https://img.icons8.com/fluency/48/c-plus-plus-logo.png",
      serviceKey: "C++",
    ),
    ServiceInfo(
      title: "Swift",
      infoText:
          "Swift is a modern, general-purpose programming language developed by Apple for iOS, macOS, watchOS, and tvOS app development. It was introduced in 2014 as a replacement for Objective-C and quickly gained popularity among developers. Swift is designed to be safe, fast, and expressive, with a syntax that is easy to read and write. It incorporates modern language features such as optionals, type inference, closures, and generics, making code more concise and less prone to errors. Swift also provides powerful frameworks and libraries that enable developers to build robust and feature-rich applications. With its strong focus on performance and developer productivity, Swift has become the preferred language for iOS and macOS app development.",
      iconUrl: "https://img.icons8.com/bubbles/100/swift.png",
      serviceKey: "Swift",
    ),
  ];
  Map<String, String> animationPaths = {
    'flutter': 'assets/flutterlogo.png',
    'java': 'assets/java.png',
    'C++': 'assets/C.png',
    'Swift': 'assets/swift.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              ///first container
              child: Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color:fColorCon,
                ),
                child: customChild(),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromRGBO(235, 235, 235, 1),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: customChildText(widget.infoText),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(serviceList.length, (index) {
                return Container(
                  width: 50, // Set the desired width
                  height: 50, // Set the desired height
                  child: customCon(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedServiceIndex = index;
                        });
                      },
                      child: Image.network(serviceList[index].iconUrl),
                    ),
                    index: index,
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget customCon({Widget? child, int index = -1}) {
    bool isSelected = selectedServiceIndex == index;
    Color containerColor = isSelected ? Colors.black12 : Colors.transparent;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedServiceIndex == index) {
            selectedServiceIndex = -1;
          } else {
            selectedServiceIndex = index;
          }
        });
      },
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            child!,
            if (isSelected)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedServiceIndex = -1;
                    });
                  },
                  behavior: HitTestBehavior.opaque,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget customChild() {
    if (selectedServiceIndex == -1) {
      return Lottie.asset(widget.animationPath);
    } else {
      String serviceKey = serviceList[selectedServiceIndex].serviceKey;
      String animationPath = animationPaths[serviceKey]!;
      return Image.asset(
        animationPath,
      );
    }
  }

  Widget customChildText(String text) {
    if (selectedServiceIndex == -1) {
      return Text(
        text,
        style: const TextStyle(
          fontSize: 18,
        ),
        textAlign: TextAlign.justify,
        softWrap: true,
      );
    } else {
      return Text(
        serviceList[selectedServiceIndex].infoText,
        style: const TextStyle(
          fontSize: 18,
        ),
        textAlign: TextAlign.justify,
        softWrap: true,
      );
    }
  }
}

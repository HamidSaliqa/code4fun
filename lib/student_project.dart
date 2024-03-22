import 'package:flutter/material.dart';

import 'detail_project.dart';

class StudentProject extends StatelessWidget {
  StudentProject({Key? key}) : super(key: key);

  final List<String> imagePaths = [
    'assets/wassa1.PNG',
    'assets/wassa2.PNG',
    'assets/wassa3.PNG',
    // ادامه مسیرهای تصاویر
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsProject(
                          imagePath: imagePaths[index % imagePaths.length]),
                    ),
                  );
                },
                child: Container(
                  width: constraints.maxWidth * 0.9,
                  // عرض کانتینر بر اساس عرض صفحه
                  height: constraints.maxWidth * 0.9 * 204 / 316,
                  // ارتفاع کانتینر بر اساس عرض و ارتفاع تصویر
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21), // بوردر رادیوس 21
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(21),
                        child: Image.asset(
                          imagePaths[index % imagePaths.length],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Project ${index + 1}',
                            style: TextStyle(
                              fontFamily: "CustomFont",
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}



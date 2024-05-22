import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'detail_project.dart';

class StudentProject extends StatefulWidget {
  const StudentProject({Key? key}) : super(key: key);

  @override
  _StudentProjectState createState() => _StudentProjectState();
}

class _StudentProjectState extends State<StudentProject> {
  List<String> imagePaths = [];
  final databaseReference = FirebaseDatabase.instance.ref("data");

  @override
  void initState() {
    super.initState();
    print(imageLink);
    getData();
  }

  List<String> dataList = [];
  List<String> imageLink = [];
  List<String> projectLink = [];

  ///get data from realTime Firebase and add the value of Description to the dataList
  void getData() {
    databaseReference.onValue.listen((DatabaseEvent event) {
      Map<dynamic, dynamic>? data =
          event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        data.forEach((key, value) {
          setState(() {
            String description = value['Description'].toString();
            String imageUrlToShow = value['imagePath'];
            String linkProject = value['projectLink'];
            imageLink.add(imageUrlToShow);
            dataList.add(description);
            projectLink.add(linkProject);
            print("This is the value of imagePath : $imageUrlToShow");
            print("This is the description : $description");
            print("This is the Link of project : $linkProject");
          });
        });
      } else {
        print("Data is null!!!!!!!!!!!!!!!!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed("/Home");
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: const Color.fromRGBO(3, 125, 214, 1),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),

        /// if we don't have image
        body: imageLink.isEmpty
            ? const Center(child: CircularProgressIndicator())

            ///else show this
            : LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return ListView.builder(
                    itemCount: imageLink.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          ///change page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsProject(
                                ///send description
                                description: dataList[index % dataList.length],

                                ///send imagePath
                                imagePath: imageLink[index % imageLink.length],

                                ///send projectLink
                                projectLink:
                                    projectLink[index % projectLink.length],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: constraints.maxWidth * 0.9,
                          height: constraints.maxWidth * 0.9 * 204 / 316,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(21),
                                child: Image.network(
                                  imageLink[index % imageLink.length],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'Project ${index + 1}',
                                    style: const TextStyle(
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
      ),
    );
  }
}

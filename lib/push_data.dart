import 'dart:io';
import 'package:code4fun/pushDataFile/image_picker_controller.dart';
import 'package:code4fun/pushDataFile/my_expanded_textField.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
String fAddedLink = '';

class PushData extends StatefulWidget {
  const PushData({super.key});

  @override
  State<PushData> createState() => _PushDataState();
}

class _PushDataState extends State<PushData> {
  ImagePickerController controller = Get.put(ImagePickerController());

  @override
  void initState() {
    // TODO: implement initState
    controller.imagePathSt = "".obs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String imageUrl = "";
    TextEditingController desController = TextEditingController();
    TextEditingController projectLinkController = TextEditingController();
    final databaseRefrence = FirebaseDatabase.instance.ref("data");
    String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();

    TextEditingController textFromFeild = TextEditingController();
    bool _isExpanded = false;

    void _selectImage() async {
      await controller.getImage();
      setState(() {});
    }



    ///Upload Data
    Future<void> _uploadData() async {
      ///When user clicked Image And Data will be Save
      ///Get a reference to storage root
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child("project");

      ///Create a reference to image store
      Reference imageToUpload = referenceDirImages.child("$uniqueFileName.jpg");

      ///Handle error / success
      try {
        ///Store the file
        await imageToUpload.putFile(File(controller.file!.path));

        ///if success : download the url
        ///imageToUpload.getDownloadURL();
        imageUrl = await imageToUpload.getDownloadURL();
        print(imageUrl);
      } catch (error) {
        print("This is the error : $error");
      }

      databaseRefrence.child(uniqueFileName).set({
        "Description": desController.text,
        "imagePath": imageUrl,
        ///اینجا میخوام مقدارش رو ارسال کنم در فایربیس
        "projectLink":projectLinkController.text,
      }).then((_) {
        setState(() {
          ///show circular
        });
        controller.imagePathSt = "".obs;
        desController.clear();
        print("successfully added");
      }).catchError((error) {
        print("Failed to add data: $error");
      }).whenComplete(() {
        setState(() {
          ///show snackBar
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Successfully Added !")));
        });
      });
    }

    return WillPopScope(
      onWillPop: () async {
        Get.toNamed("/Home");
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(100, 94, 90, 90),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),

                          ///Select Photo
                          child: controller.imagePathSt.isEmpty
                              ? InkWell(
                                  onTap: _selectImage,
                                  child: const Center(
                                      child: Text("Select Your Photo")),
                                )
                              : InkWell(
                                  onTap: _selectImage,
                                  child: Image.file(
                                      File(controller.imagePathSt.toString()))),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                     Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          ///
                          child: TextField(
                            controller: projectLinkController,
                            decoration: const InputDecoration(
                              hintText: "Add Link",
                            ),
                          ),

                        )),
                    LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            width: constraints.maxWidth,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color.fromRGBO(235, 235, 235, 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: TextField(
                                controller: desController,
                                decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  hintText: "Description",
                                ),
                                maxLines: null,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 65,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 6, 149, 203),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(34),
                              ),
                            ),
                          ),
                          onPressed: _uploadData,
                          child: const Text(
                            "Push & Upload DATA",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: "CustomFont",
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



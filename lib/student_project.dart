import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'detail_project.dart';

class StudentProject extends StatefulWidget {
  const StudentProject({Key? key}) : super(key: key);

  @override
  _StudentProjectState createState() => _StudentProjectState();
}

class _StudentProjectState extends State<StudentProject> {
  List<String> imagePaths = [];

  @override
  void initState() {
    super.initState();
    fetchImageUrls().then((urls) {
      setState(() {
        imagePaths = urls;
      });
    }).catchError((error) {
      print('Error fetching image URLs: $error');
    });
  }

  Future<List<String>> fetchImageUrls() async {
    try {
      final storage = firebase_storage.FirebaseStorage.instance;
      final ref = storage.ref().child('project');
      final result = await ref.listAll();
      final List<String> urls = [];
      for (final item in result.items) {
        final url = await item.getDownloadURL();
        urls.add(url);
      }
      return urls;
    } catch (e) {
      print('Error fetching image URLs: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: imagePaths.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ListView.builder(
            itemCount: imagePaths.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsProject(
                        imagePath: imagePaths[index % imagePaths.length],
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
    );
  }
}
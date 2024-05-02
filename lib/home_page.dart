import 'package:code4fun/widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imagePaths = [];
  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    fetchImageUrlsForSlider().then((urls) {
      if (_isMounted) {
        setState(() {
          imagePaths = urls;
        });
      }
    }).catchError((error) {
      print('Error fetching image URLs: $error');
    });
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  Future<List<String>> fetchImageUrlsForSlider() async {
    try {
      final storage = firebase_storage.FirebaseStorage.instance;
      final ref = storage.ref().child("Slider_Image");
      final result = await ref.listAll();
      final List<String> urls = [];
      for (final items in result.items) {
        final url = await items.getDownloadURL();
        urls.add(url);
      }
      return urls;
    } catch (e) {
      print("Error Feching Image Url For Slider : $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
          body: Column(
            children: [
              SafeArea(
                child: Container(
                  color: const Color.fromRGBO(3, 125, 214, 0.8),
                  child: Row(
                    children: [
                      Image.asset("assets/wassalogo.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "WASSA",
                            style: TextStyle(
                                fontFamily: "CustomFont",
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          Text(
                            "Woman Activity & Social service Association",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "CustomFont",
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FutureBuilder<List<String>>(
                  future: Future.value(imagePaths),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Lottie.asset("assets/loading.json", width: 20, height: 80);
                    } else if (snapshot.hasError) {
                      return const Text('Error fetching image URLs');
                    } else if (snapshot.hasData) {
                      final imageUrl = snapshot.data!;
                      return slider(image: imageUrl);
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
              Expanded(
                flex: 3,
                child: customGridview(context),
              ),
            ],
          )),
    );
  }
}

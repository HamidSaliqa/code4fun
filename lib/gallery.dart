import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class GalleryPage extends StatelessWidget {
  final List<String> images = [
    'assets/wassa1.PNG',
    'assets/wassa2.PNG',
    'assets/wassa3.PNG'
  ];

  GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoViewPage(imageUrl: images[index]),
                ),
              );
            },
            child: Image.asset(images[index]),
          );
        },
      ),
    );
  }
}

class PhotoViewPage extends StatelessWidget {
  final String imageUrl;

  const PhotoViewPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
///font
const labelTextStyle = TextStyle(
  fontSize:30,
  fontFamily:'CustomFont',
);
///slider for image
Widget slider(){
  return  ImageSlideshow(
    /// Width of the [ImageSlideshow].
    width: double.infinity,

    /// Height of the [ImageSlideshow].
    height:150,

    /// The page to show when first creating the [ImageSlideshow].
    initialPage: 0,

    /// The color to paint the indicator.
    indicatorColor: Colors.blue,

    /// The color to paint behind th indicator.
    indicatorBackgroundColor: Colors.grey,

    /// The widgets to display in the [ImageSlideshow].
    /// Add the sample image file into the images folder
    children: [
      Image.asset(
        'assets/wassa1.PNG',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/wassa2.PNG',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/wassa3.PNG',
        fit: BoxFit.cover,
      ),
    ],

    /// Called whenever the page in the center of the viewport changes.
    onPageChanged: (value) {
      print('Page changed: $value');
    },

    /// Auto scroll interval.
    /// Do not auto scroll with null or 0.
    autoPlayInterval: 3000,

    /// Loops back to first slide.
    isLoop: true,
  );
}

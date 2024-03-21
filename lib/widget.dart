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

///Custom Button for home page

class CustomButton extends StatelessWidget {
  final String nameOfButton;
  final VoidCallback onPressed;

  CustomButton({required this.nameOfButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black12, offset: Offset(2, 2), blurRadius: 8)
          ]),
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(21))),
            backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(3, 125, 214, 1))),
        onPressed: onPressed,
        child: Text(
          nameOfButton,style: TextStyle(fontFamily:"CustomFont",fontSize: 30),
        ),
      ),
    );
  }
}
///names for home page Button
var libraryNames = ["About WASSA", "Our Services", "Who Can Benefit?","Student Project","Gallery","Contact"];

///Home page Grid view use custom Button
 Widget customGridview(){
  return GridView.count(
    crossAxisCount: 2,
    children: List.generate(libraryNames.length, (index) {
      return CustomButton(
        nameOfButton: libraryNames[index],
        onPressed: () {},
      );
    }),
  );
}
import 'package:flutter/material.dart';

class ScreenA extends StatefulWidget {
  static const String id = 'screen_a';

  @override
  _ScreenAState createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  List<Widget> selectedImages() {
    List<Widget> selectedImages = [];

    for (int index = 1; index < 4; index++) {
      Widget item = Hero(
        tag: 'image$index',
        child: Image.asset('assets/images/$index.png'),
        transitionOnUserGestures: true,
//        flightShuttleBuilder:
//            (flightContext, animation, direction, fromContext, toContext) {
//          return Image.asset('assets/images/7.png');
//        },
//        placeholderBuilder: (context, size, child) {
//          return child;
//        },
      );
      selectedImages.add(item);
    }
    return selectedImages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen A'),
      ),
      body: SafeArea(
        child: GridView.count(
          primary: false,
          shrinkWrap: true,
          crossAxisCount: 3,
          children: selectedImages(),
          padding: EdgeInsets.all(8),
        ),
      ),
    );
  }
}

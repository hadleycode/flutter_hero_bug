import 'package:flutter/material.dart';

class ScreenA extends StatefulWidget {
  static const String id = 'screen_a';

  @override
  _ScreenAState createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  List<Column> selectedImages() {
    List<Column> selectedImages = [];

    for (int index = 1; index < 4; index++) {
      Column item = Column(
        children: <Widget>[
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 10,
              child: Hero(
                  tag: 'image$index',
                  child: Image.asset('assets/images/$index.png')),
            ),
          ),
        ],
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Card(
                      child: GridView.count(
                        primary: false,
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        children: selectedImages(),
                        padding: EdgeInsets.all(8),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

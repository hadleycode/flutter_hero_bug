import 'package:flutter/material.dart';

class ScreenB extends StatefulWidget {
  static const String id = 'screen_b';
  @override
  _ScreenBState createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  dynamic makeCard(int index) {
    return Card(
      child: ListTile(
        leading: Hero(
            tag: 'image$index', child: Image.asset('assets/images/$index.png')),
        title: Text('Card $index'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen B')),
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 14,
          itemBuilder: (BuildContext context, int index) {
            return makeCard(index + 1);
          },
        ),
      ),
    );
  }
}

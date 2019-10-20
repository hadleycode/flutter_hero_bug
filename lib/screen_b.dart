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
        leading: myHero(
          index: index,
        ),
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
          addAutomaticKeepAlives: true,
          itemBuilder: (BuildContext context, int index) {
            return makeCard(index + 1);
          },
        ),
      ),
    );
  }
}

class myHero extends StatefulWidget {
  final int index;

  myHero({this.index});

  @override
  _myHeroState createState() => _myHeroState();
}

class _myHeroState extends State<myHero> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'image${widget.index}',
      child: Image.asset('assets/images/${widget.index}.png'),
      transitionOnUserGestures: true,
//          flightShuttleBuilder:
//              (flightContext, animation, direction, fromContext, toContext) {
//            return Image.asset('assets/images/5.png');
//          },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

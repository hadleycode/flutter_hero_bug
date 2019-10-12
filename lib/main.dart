import 'package:flutter/material.dart';
import 'package:flutter_hero_test/screen_a.dart';
import 'package:flutter_hero_test/screen_b.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();

  int _currentIndex = 0;

  final screenRouteFactories = {
    '/': () => MaterialPageRoute(builder: (context) => ScreenA()),
    ScreenB.id: () => MaterialPageRoute(builder: (context) => ScreenB()),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            body: _buildBody(),
            bottomNavigationBar: _buildBottomNavigationBar(context),
          );
        },
      ),
    );
  }

  Widget _buildBody() => MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: (route) => screenRouteFactories[route.name]());

  Widget _buildBottomNavigationBar(context) {
    return BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.blueAccent,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          _buildBottomNavigationBarItem(
              'Screen A', Icons.text_fields, Colors.blue),
          _buildBottomNavigationBarItem(
              'Screen B', Icons.settings, Colors.lightBlue),
        ],
        onTap: (routeIndex) {
          if (routeIndex == _currentIndex) {
            //do nothing;
            return;
          } else if (_currentIndex == 1 && navigatorKey.currentState.canPop()) {
            _currentIndex = routeIndex;

            navigatorKey.currentState.pop();
          } else {
            _currentIndex = routeIndex;
            navigatorKey.currentState
                .pushNamed(screenRouteFactories.keys.toList()[routeIndex]);
          }
        });
  }

  _buildBottomNavigationBarItem(name, icon, colour) => BottomNavigationBarItem(
      icon: Icon(icon), title: Text(name), backgroundColor: colour);
}

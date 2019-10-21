import 'package:flutter/material.dart';
import 'package:guideasy_app/view/pages/HomePage.dart';
import 'package:guideasy_app/view/pages/SplashScreen.dart';

import 'Theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guideasy App',
      theme: applicationTheme,
      home: SplashScreen(),
    );
  }
}


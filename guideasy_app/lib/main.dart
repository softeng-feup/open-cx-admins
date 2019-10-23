import 'package:flutter/material.dart';
import 'package:guideasy_app/constants.dart';

import 'Theme.dart';
import 'controller/Routes/Router.dart';

void main() => runApp(GuideasyApp());

class GuideasyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guideasy App',
      theme: applicationTheme,
      initialRoute: splashRoute,
      onGenerateRoute: Router.generateRoute,
    );
  }
}


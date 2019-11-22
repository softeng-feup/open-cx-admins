import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guideasy_app/constants.dart';
import 'package:guideasy_app/model/PointOfInterest.dart';
import 'package:guideasy_app/view/pages/HomePage.dart';
import 'package:guideasy_app/view/pages/MapPage.dart';
import 'package:guideasy_app/view/pages/SplashScreen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => new SplashScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => new HomePage());
      case mapRoute:
        final PointOfInterest poi = settings.arguments;
        return MaterialPageRoute(builder: (_) => new MapPage(initialTarget: poi));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}
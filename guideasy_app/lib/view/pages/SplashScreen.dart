import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guideasy_app/constants.dart';
import 'package:guideasy_app/model/AppState.dart';
import 'package:guideasy_app/redux/ActionCreators.dart';

import 'package:guideasy_app/view/widgets/RunningAnimation.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  bool _firstBuild;

  @override
  void initState() {
    _firstBuild = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_firstBuild) {
      _firstBuild = false;
      StoreProvider.of<AppState>(context).dispatch(getPointsOfInterest());
    }

    return new Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
          Spacer(
            flex: 5,
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: Text(
                  "Guideasy",
                  style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 8,
            child: new RunningAnimation(
              height: 200,
              width: 200,
              duration: 2,
              begin: -300.0,
              end: 300.0,
              animationCallback: () {
                Navigator.pushNamedAndRemoveUntil(context, homeRoute, (_)  => false);
              },
            )
          ),
        ],
      ),
    );
  }

}
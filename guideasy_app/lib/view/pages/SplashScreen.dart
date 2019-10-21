import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenState();

}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //final animation = Tween(begin: 0, end: 10).animate(_controller);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
          Spacer(
            flex: 1,
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
          Expanded(
            flex: 2,
            child: AnimatedBuilder(
              animation: _controller,
              child: Container(width: 200.0, height: 200.0, color: Colors.green),
              builder: (BuildContext context, Widget child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: child,
                );
              },
            )
          ),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }

}
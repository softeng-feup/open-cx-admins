import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guideasy_app/controller/Routes/SlideTopRoute.dart';
import 'package:guideasy_app/view/pages/SplashScreen.dart';

import 'package:guideasy_app/constants.dart';

class MapSlideButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FlatButton(
        color: Theme.of(context).backgroundColor,
        child: Icon(
          Icons.keyboard_arrow_up,
          color: Colors.white,
          size: 100,
        ),
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());

          Navigator.pushNamed(context, mapRoute);
        },
      ),
    );
  }

}
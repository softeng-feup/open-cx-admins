import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        },
      ),
    );
  }

}
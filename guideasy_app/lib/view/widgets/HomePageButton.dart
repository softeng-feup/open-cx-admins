import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  final IconData icon;

  HomePageButton({@required this.icon});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
      child: Icon(
        icon,
        color: Theme.of(context).backgroundColor,
        size: 80,

      ),
      onPressed: () {
        FocusScope.of(context).requestFocus(new FocusNode());

        print("Clicked navigation button");
      },
    );
  }
}
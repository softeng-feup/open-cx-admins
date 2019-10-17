import 'package:flutter/material.dart';

const Color titleColor = Colors.white;
const Color backgroundColor = Color(0xffff9900);
const String defaultFontFamily = 'Pacifico';


ThemeData applicationTheme = new ThemeData(

  primaryColor: titleColor,
  backgroundColor: backgroundColor,
  fontFamily: defaultFontFamily,

  textTheme: TextTheme(
    title: TextStyle(fontSize: 30.0, color: titleColor, fontWeight: FontWeight.w400),
    display1: TextStyle(fontSize: 40.0, color: titleColor),
  ),
);
import 'package:flutter/material.dart';

const Color titleColor = Colors.white;
const Color backgroundColor = Color(0xffff9900);
const String defaultFontFamily = 'Roboto';


ThemeData applicationTheme = new ThemeData(

  primaryColor: titleColor,
  backgroundColor: backgroundColor,
  fontFamily: defaultFontFamily,

  textTheme: TextTheme(
    title: const TextStyle(fontSize: 30.0, color: titleColor, fontWeight: FontWeight.w400, fontFamily: 'Pacifico'),
    display1: const TextStyle(fontSize: 40.0, color: titleColor, fontFamily: 'Pacifico'),
    body2: TextStyle(fontSize: 20.0, color: titleColor, fontWeight: FontWeight.w300),
  ),
);
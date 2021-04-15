import 'package:flutter/material.dart';
import 'package:online_astro24/utils/setup.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
  primaryColor: Color(pinkColor),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
  );
}

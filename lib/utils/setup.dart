

//app colors
// final appbasedColor =  hexStringToHexInt('#292b34');
import 'package:flutter/material.dart';

final blueGreyColor = hexStringToHexInt('#292b34');
final facebookColor = hexStringToHexInt('#4267B2');
final googleColor = hexStringToHexInt('#dd4b39');
final pinkColor = hexStringToHexInt('#FF3366');
final inActiveColor = hexStringToHexInt('#DCDADA');
final outlineColor = hexStringToHexInt('#F6CFCE');

const String apiKey = "AIzaSyBmttZbafnoHuShZ-doazIKcuD7-T8Y8OI";

// AppBaseUrl

final String aPPmAINuRL = "https://talkastro.devclub.co.in/userapi/";




hexStringToHexInt(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff' + hex : hex;
  int val = int.parse(hex, radix: 16);
  return val;
}


appBarGradient(){
  return LinearGradient(
    colors: [
      Color(hexStringToHexInt(
          "#fd6e56")),
      Color(hexStringToHexInt(
          "#fe9354")),
    ],
  );
}

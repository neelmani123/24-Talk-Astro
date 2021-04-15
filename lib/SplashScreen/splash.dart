import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:online_astro24/BottomNavigationBar.dart';
import 'package:online_astro24/Home.dart';
import 'package:online_astro24/LogIn_SignUp_Otp/Login.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  static const String splash = "splashScreen";

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTime();
  }


  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    String  _userId = '';
    var _prefs = await SharedPreferences.getInstance();
    _userId = _prefs.getString('userID')??'';
    if(_userId != null && _userId != '')
    {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BottomNavigation()), (Route<dynamic> route) => false);
    }
    else
    {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login()), (Route<dynamic> route) => false);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/Images/background.png"),
                fit: BoxFit.fitWidth)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(

              child: Image.asset("Assets/Images/logo.png",height:190,),
            ),
            Container (
                margin: EdgeInsets.only(top: 25),
                child: Text(
                  "TALK ASTRO 24",
                  style: TextStyle(
                      color: Color(pinkColor),
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                     ),
                )),
            Container (
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "ONLINE ASTROLOGY PREDICTIONS",
                  style: TextStyle(
                    color: Color(pinkColor),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: 20),
                child: SpinKitRipple(
                  size: 60,
              color: Color(pinkColor),
            )),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:online_astro24/utils/setup.dart';

class InternetConnection extends StatefulWidget {
  @override
  _InternetConnectionState createState() => _InternetConnectionState();
}

class _InternetConnectionState extends State<InternetConnection> {


  void checkConnection () async
  {
      try {
        final result = await InternetAddress.lookup("google.com");
        if(result.isNotEmpty && result[0].rawAddress.isNotEmpty)
          {
            print("connected");
          }
      } on SocketException catch (_)
    {
      print("No connection");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("Assets/Images/no_internet_icon.png"),
            Container(
              margin: EdgeInsets.only(top: 20),
                child: Text(
              "No Internet Connection",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            )),
            Container(margin: EdgeInsets.only(top: 10),child: Text("No internet connection found")),
            Container(child: Text("Please check your internet settings")),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 50,left: 20,right: 20),
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 95),
                child: Text(
                  "Retry",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                  color: Color(blueGreyColor),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 2.0,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

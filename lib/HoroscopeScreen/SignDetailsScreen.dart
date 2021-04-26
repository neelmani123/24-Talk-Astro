import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:online_astro24/Modal/HorosCopeModel.dart';
import 'package:online_astro24/httpHelper/httpHelper.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:http/http.dart' as http;

class SignDetailsScreen extends StatefulWidget {
  static const String signDetailScreen = "/signDetailScreen";


  final imageUrl;
  final title;

  SignDetailsScreen({this.imageUrl,this.title});

  @override
  _SignDetailsScreenState createState() => _SignDetailsScreenState();
}

class _SignDetailsScreenState extends State<SignDetailsScreen> {
  final DateTime _currentDate = DateTime.now();
  HttpService _httpService = HttpService();
  String current_date="",description="",compatibility="",mood="",color="",lucky_number="",lucky_time="";
  bool _isLoading=true;
  @override
  void initState() {
    horosCope();
    // TODO: implement initState
    super.initState();
  }

 Future horosCope()async
  {
    Map<String,String>headers={'Content-Type':'application/json'};
    final res=jsonEncode({"sign":widget.title});
    var response=await http.post("https://talkastro.devclub.co.in/userapi/horoscope",
        headers:headers, body: res);
    Map data=json.decode(response.body);
   setState(() {
     current_date=data['current_date'];
     description=data['description'];
     compatibility=data['compatibility'];
     mood=data['mood'];
     color=data['color'];
     lucky_number=data['lucky_number'];
     lucky_time=data['lucky_time'];
     print(lucky_time);
     _isLoading=false;
   });
  }

  @override
  Widget build(BuildContext context) {
    String _formattedDate = DateFormat.yMMMd().format(_currentDate);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(pinkColor),
        title: Text("${widget.title}"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                 "Assets/Images/background.png",
                ),
                fit: BoxFit.cover)),
        child: _isLoading?Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ):ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: Text(current_date??'',
                style: TextStyle(
                  fontSize: 18,
                    color: Color(pinkColor), fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Today's Horoscope",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(pinkColor),
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Image.asset(
                    widget.imageUrl,
                    height: 140,
                  ),
                  Text(
                    widget.title??'',
                    style: TextStyle(
                        color: Color(pinkColor),
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        children: [Text(lucky_number??'',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),), Text("Lucky"),Text("number")],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(40)),
                          ),
                          Text("Lucky color"),
                          Text(color??''),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Text("M",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
                          Text("Lucky"),
                          Text("letter"),
                        ],
                      )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                  description??''),
            )
          ],
        ),
      ),
    );
  }
}

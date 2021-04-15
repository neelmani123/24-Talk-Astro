import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:online_astro24/utils/setup.dart';

class SignDetailsScreen extends StatelessWidget {
  static const String signDetailScreen = "/signDetailScreen";


  final imageUrl;

  SignDetailsScreen({this.imageUrl});



  final DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String _formattedDate = DateFormat.yMMMd().format(_currentDate);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(pinkColor),
        title: Text("Aries"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                 "Assets/Images/background.png",
                ),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: Text(_formattedDate.toString(),
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
                    imageUrl,
                    height: 140,
                  ),
                  Text(
                    "Aries",
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
                        children: [Text("17",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),), Text("Lucky"),Text("number")],
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
                          Text("blue"),
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
                  "From the professional astrologer to the astro curious,Astrology.com offers avenues for exploring some of life’s deepest questions.Unpack information about your zodiac sign, planets, elements, and modalities, and gain insight daily with our free Tarot readings. Receive instant cosmic guidance at your fingers tips with Astrology"),
            )
          ],
        ),
      ),
    );
  }
}

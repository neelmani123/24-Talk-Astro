import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_astro24/HoroscopeScreen/SignDetailsScreen.dart';
import 'package:online_astro24/Widgets/Horoscope.dart';
import 'package:online_astro24/utils/setup.dart';

class SignScreen extends StatelessWidget {
  static const String signScreen = "SignScreen";

  List sign = [
    {
      "images": "Assets/Sign/Group 32092.png",
      "title": "Aries",
    },
    {
      "images": "Assets/Sign/Group 32093.png",
      "title": "Gemini",
    },
    {
      "images": "Assets/Sign/Group 32094.png",
      "title": "Taurus",
    },
    {
      "images": "Assets/Sign/Group 32095.png",
      "title": "Sagittarius",
    },
    {
      "images": "Assets/Sign/Group 32096.png",
      "title": "Libra",
    },
    {
      "images": "Assets/Sign/Group 32097.png",
      "title": "Leo",
    },
    {
      "images": "Assets/Sign/Group 32098.png",
      "title": "Pisces",
    },
    {
      "images": "Assets/Sign/Group 32099.png",
      "title": "Virgo",
    },
    {
      "images": "Assets/Sign/Group 32100.png",
      "title": "Cancer",
    },
    {
      "images": "Assets/Sign/Group 32101.png",
      "title": "Capricorn",
    },
    {
      "images": "Assets/Sign/Group 32102.png",
      "title": "Aquarius",
    },
    {
      "images": "Assets/Sign/Group 32103.png",
      "title": "Scorpio",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "Assets/Images/background.png",
                  ),
                  fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    child: Text(
                      "Welcome! Let's get started!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(pinkColor),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text("What's your star sign?",
                    style: TextStyle(
                        color: Color(0xFF3D3D3D),
                        fontSize: 31,
                        fontWeight: FontWeight.w500)),
                Column(
                  children: [
                    Container(
                        child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.8,
                        crossAxisCount: 3,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: sign.length,
                      itemBuilder: (ctx, i) => Horoscope(
                        imageUrl: sign[i]["images"],
                        title: sign[i]["title"],
                        onTap: () {

                          Navigator.push(context, MaterialPageRoute(builder: (ctx) => SignDetailsScreen(imageUrl: sign[i]["images"],)));


                        },
                      ),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

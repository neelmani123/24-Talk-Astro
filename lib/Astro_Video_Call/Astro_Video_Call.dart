import 'package:flutter/material.dart';
import 'package:online_astro24/AstroDetailsScreen.dart';
import 'package:online_astro24/Astro_Video_Call/Astro_Video_descriptionScreen.dart';
import 'package:online_astro24/Widgets/bottomSheet.dart';
import 'package:online_astro24/utils/setup.dart';

class AstroVideoCall extends StatelessWidget {
  static const String astroVideoCall = "astroVideoCall";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(pinkColor),
        title: Text("Video Call"),
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("Assets/Images/background.png",),fit: BoxFit.fitWidth)),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 4.0,
                  ),
                ],),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => AstroVideoDetailsScreen()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "Assets/Images/user_pic.png",
                                  height: 55,
                                ),
                                Text("Astro Anamika"),
                                SizedBox(
                                  height: 5,
                                ),
                                Image.asset(
                                  "Assets/Images/stars.png",
                                  height: 25,
                                ),
                                Text("2472 total"),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: ()
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => AstroVideoDetailsScreen()));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "Assets/Images/tarot.png",
                                      height: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text("Vedic, Tarot")
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "Assets/Images/experience.png",
                                      height: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text("5 Years experience"),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "Assets/Images/language.png",
                                      height: 19,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text("Hindi , English"),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "Assets/Images/rupees_icon.png",
                                      height: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text("599/- Only Per Mint."),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: ()
                      {
                        bottomSheet(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          right: 30,
                          top: 20,
                        ),
                        width: 160,
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                            color: Color(blueGreyColor),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "Assets/Icons/video_call_icon.png",
                              height: 27,
                            ),
                            Text(
                              "VIDEO NOW",
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 4.0,
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: ()
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => AstroVideoDetailsScreen()));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "Assets/Images/user_pic.png",
                                  height: 55,
                                ),
                                Text("Astro Anamika"),
                                SizedBox(
                                  height: 5,
                                ),
                                Image.asset(
                                  "Assets/Images/stars.png",
                                  height: 25,
                                ),
                                Text("2472 total"),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: ()
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (ctx) => AstroVideoCall()));
                            },

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "Assets/Images/tarot.png",
                                      height: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text("Vedic, Tarot")
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "Assets/Images/experience.png",
                                      height: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text("5 Years experience"),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "Assets/Images/language.png",
                                      height: 19,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text("Hindi , English"),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "Assets/Images/rupees_icon.png",
                                      height: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text("599/- Only Per Mint."),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          top: 20,
                                        ),
                                        width: 130,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        alignment: Alignment.bottomRight,
                                        decoration: BoxDecoration(
                                            color: Colors.redAccent,
                                            borderRadius:
                                            BorderRadius.circular(30)),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                              "Assets/Icons/video_call_icon.png",
                                              height: 20,
                                            ),
                                            Text(
                                              "BUSY NOW",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                bottom: 12, left: 5),
                                            child: Text(
                                              "Wait time 10m",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500),
                                            )))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



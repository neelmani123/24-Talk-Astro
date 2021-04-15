import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:http/http.dart' as http;

class NotificationScreen extends StatefulWidget {
  static const String notification = "NotificationScreen";

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(pinkColor),
        title: Text("Notification"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/Images/background.png"),
                fit: BoxFit.fitWidth)),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Today",
                      style: TextStyle(
                          color: Color(pinkColor),
                          fontWeight: FontWeight.w500,
                          fontSize: 21),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "िहदूधममपंचांग का िवशेष मह है। आपको कोई भी शुभ कायकरनेकेिलए सवम समय देखना हैतो पंचांग का ही सहारा िलया जाता है। ितिथ, वार, न, योग और करण पंचांग केपंच अंग कहेजातेह। दरअसल पंचांग एक ऐसी तािलका को कहा जाता ह",
                          style: TextStyle(fontSize: 15,color: Colors.blueGrey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("wwww.online.Astrotalk.com",style: TextStyle(color: Color(pinkColor)),),
                            Text("25-11-2020",style: TextStyle(color: Color(pinkColor))),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Yesterday",
                      style: TextStyle(
                          color: Color(pinkColor),
                          fontWeight: FontWeight.w500,
                          fontSize: 21),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "िहदूधममपंचांग का िवशेष मह है। आपको कोई भी शुभ कायकरनेकेिलए सवम समय देखना हैतो पंचांग का ही सहारा िलया जाता है। ितिथ, वार, न, योग और करण पंचांग केपंच अंग कहेजातेह। दरअसल पंचांग एक ऐसी तािलका को कहा जाता ह",
                          style: TextStyle(fontSize: 15,color: Colors.blueGrey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("wwww.online.Astrotalk.com",style: TextStyle(color: Color(pinkColor)),),
                            Text("25-11-2020",style: TextStyle(color: Color(pinkColor))),
                          ],
                        )
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

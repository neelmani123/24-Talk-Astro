import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_astro24/utils/setup.dart';

class QuestionHistory extends StatelessWidget {
  static const String questionHistory = "questionHistory";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question History"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/Images/background.png"),
                fit: BoxFit.fitWidth)),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 4.0,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ask Question",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 21,
                              ),
                            ),
                            Text(
                              "Pending",
                              style: TextStyle(color: Color(pinkColor)),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text("Ranu"),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text("25-11-2020"),
                                    Text("05:30:00")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.grey,thickness: 1,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("Name",style: TextStyle(fontWeight: FontWeight.w500),),
                                  SizedBox(height: 5,),
                                  Text("Ranu",style: TextStyle(color: Colors.grey),),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Gender",style: TextStyle(fontWeight: FontWeight.w500),),
                                  SizedBox(height: 5,),
                                  Text("Female",style: TextStyle(color: Colors.grey),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Place of Birth",style: TextStyle(fontWeight: FontWeight.w500),),
                                  SizedBox(height: 5,),
                                  Text("New delhi , India",style: TextStyle(color: Colors.grey),),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Time of Birth",style: TextStyle(fontWeight: FontWeight.w500),),
                                  SizedBox(height: 5,),
                                  Text("13 : 13",style: TextStyle(color: Colors.grey),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Question",style: TextStyle(fontWeight: FontWeight.w500),),
                                  SizedBox(height: 5,),
                                  Text("xyz",style: TextStyle(color: Colors.grey),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(top: 5,bottom: 5),
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                      child: Text(
                        "Still Our Astrologer Working on Your Question",
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

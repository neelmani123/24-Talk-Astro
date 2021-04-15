import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_astro24/utils/setup.dart';

const Color inActiveCardColor = Color(0xFFE2E2E2);
Color activeCardColor = Color(pinkColor);

enum ButtonType {
  SomeOneElse,
  Myself,
}

Color activeTextColor = Colors.white;
Color inActiveTextColor = Colors.black;

class AskQuestionScreen extends StatefulWidget {
  static const String askQuestionScreen = "/askQuestionScreen";

  @override
  _AskQuestionScreenState createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  Color mySelfCardColor = activeCardColor;
  Color mySelfTextColor = activeTextColor;

  Color someOneElseCardColor = inActiveCardColor;
  Color someOneElseTextColor = inActiveTextColor;

  // 1 = someone ELSE;
  // 2 = MYSELF;

  void updateColor(ButtonType buttonType) {
    if (buttonType == ButtonType.SomeOneElse) {
      if (someOneElseCardColor == inActiveCardColor) {
        someOneElseCardColor = activeCardColor;
        someOneElseTextColor = activeTextColor;
        mySelfCardColor = inActiveCardColor;
        mySelfTextColor = inActiveTextColor;
      } else {
        someOneElseCardColor = inActiveCardColor;
        someOneElseTextColor = inActiveTextColor;
        mySelfCardColor = activeCardColor;
        mySelfTextColor = activeTextColor;
      }
    }
    if (buttonType == ButtonType.Myself) {
      if (mySelfCardColor == activeCardColor) {
        mySelfCardColor = inActiveCardColor;
        mySelfTextColor = inActiveTextColor;
        someOneElseCardColor = activeCardColor;
        someOneElseTextColor = activeTextColor;
      } else {
        mySelfCardColor = activeCardColor;
        mySelfTextColor = activeTextColor;
        someOneElseCardColor = inActiveCardColor;
        someOneElseTextColor = inActiveTextColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ASK A QUESTION"),
        backgroundColor: Color(pinkColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5),
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Is this for you or someone else ?",
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                updateColor(ButtonType.SomeOneElse);
                              });
                            },
                            child: _button(
                              text: "Someone else",
                              kStyle: TextStyle(color: someOneElseTextColor),
                              color: someOneElseCardColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                updateColor(ButtonType.Myself);
                              });
                            },
                            child: _button(
                                text: "Myself",
                                color: mySelfCardColor,
                                kStyle: TextStyle(color: mySelfTextColor)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 4.0,
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    "Ask any question from our expert panel of astrologers and get answer within 24 hours.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Question charge is Rs.100 per Question only.",
                    style: TextStyle(color: Color(pinkColor)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Ask your Question",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      decoration: InputDecoration(
                          hintText: "Write here....",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      child: Text(
                        "Post your question",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
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
          ],
        ),
      ),
    );
  }
}

Widget _button({String text, Color color, TextStyle kStyle}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    child: Text(
      text,
      style: kStyle,
      textAlign: TextAlign.center,
    ),
  );
}

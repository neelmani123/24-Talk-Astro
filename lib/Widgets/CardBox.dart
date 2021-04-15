import 'package:flutter/material.dart';
import 'package:online_astro24/utils/setup.dart';


class CardBox extends StatelessWidget {
  final String imageUrl;
  final String text;
  final String subText;
  final Function onTap;

  CardBox(
      {@required this.imageUrl,
        @required this.text, this.subText,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 4.0,
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.only(top: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imageUrl,
                  height: 55,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Color(pinkColor), fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 25),
                  child: Text(
                    subText,
                    style: TextStyle(color: Color(pinkColor), fontSize: 11),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
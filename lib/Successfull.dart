import 'package:flutter/material.dart';
import 'package:online_astro24/utils/setup.dart';

class Successfull extends StatefulWidget {
  @override
  _SuccessfullState createState() => _SuccessfullState();
}

class _SuccessfullState extends State<Successfull> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Assets/Images/background.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Your Order Placed Successfull?",style: TextStyle(fontSize: 20,color: Color(pinkColor)),)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:online_astro24/BottomNavigationBar.dart';
import 'package:online_astro24/Home.dart';
import 'package:online_astro24/utils/setup.dart';


class OrderSuccessFullScreen extends StatelessWidget {

  static const String orderSuccessScreen = "orderSuccessScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            [
              Image.asset("Assets/Images/checkoutgif.gif",height: 350,),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Text("Your order is successfully.",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),),

              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('You can track the delivery in the "Order" Section',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, BottomNavigation.bottomNavigationScreen);
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 50,left: 20,right: 20),
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                  child: Text(
                    "Continue Shopping",
                    style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w500),
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
        ),
      ),
    );
  }
}

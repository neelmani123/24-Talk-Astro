import 'package:flutter/material.dart';
import 'package:online_astro24/DrawerContent/MyWalletScreen.dart';
import 'package:online_astro24/utils/setup.dart';

void bottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  child:
                                  Image.asset("Assets/Images/user_pic.png"),
                                  radius: 40,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Astro Anamika",
                                        style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text("Chat:"),
                                          Text(
                                            ' \u{20B9}40/mins',
                                            style: TextStyle(
                                                color: Color(pinkColor)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                "Assets/Icons/a_cancel.png",
                                height: 22,
                              ),
                            ))
                      ],
                    ),
                    Container(
                      margin:
                      EdgeInsets.symmetric(vertical: 20,horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "Assets/Images/m_bullat.png",
                                        height: 25,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Text(
                                            "Wallet Balance",
                                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text("₹ 30.00", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.grey,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "Assets/Icons/a_clock.png",
                                        height: 25,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Text("Max Duration", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text("5min", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.grey,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Container(
                            child: Text(
                                "Please ensure that your balance is valid for 0 min cost. "),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyWallet.myWallet);

                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      left: 20,
                      right: 20,bottom: 20
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Text(
                    "RECHARGE",
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
        );
      });
}
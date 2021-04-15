import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_astro24/utils/setup.dart';

class TransactionHistory extends StatefulWidget {
  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  List call = [
    {
      "callTime": "00:00:0026",
      "amount": "10.00",
      "date": "19 Jun, 2020",
    },
    {
      "callTime": "00:00:0026",
      "amount": "30.00",
      "date": "19 Jun, 2020",
    },
    {
      "callTime": "00:00:0026",
      "amount": "40.00",
      "date": "19 Jun, 2020",
    },
  ];
  List videoCall = [
    {
      "callTime": "00:00:0026",
      "amount": "10.00",
      "date": "19 Jun, 2020",
    },
    {
      "callTime": "00:00:0026",
      "amount": "30.00",
      "date": "19 Jun, 2020",
    },
    {
      "callTime": "00:00:0026",
      "amount": "40.00",
      "date": "19 Jun, 2020",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Transaction History"),
          backgroundColor: Color(pinkColor),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "CALL",
              ),
              Tab(
                text: "CHAT",
              ),
              Tab(
                text: "VIDEO CALL ",
              ),
              Tab(
                text: "ASK QUESTION",
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("Assets/Images/background.png"),
                  fit: BoxFit.fitWidth)),
          child: TabBarView(children: [
            call.length != 0
                ? Column(
                  children: call.map((data) =>  Container(
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
                    margin: EdgeInsets.all(3),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Image.asset(
                                      "Assets/Images/talk.png",
                                      height: 35,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Service Amount",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "Call for 00:00:26",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text('-\u{20B9} ${data["amount"]}',style: TextStyle( fontSize: 16,
                                      fontWeight: FontWeight.w500),),
                                  Text(
                                    "19 Jun, 2020",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(margin: EdgeInsets.only(top: 20),child: Text("Paid by Wallet",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),)),

                      ],
                    ),
                  ),).toList()
                )
                : Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("Assets/Icons/no_record_icon.png"),
                        Container(
                            margin: EdgeInsets.only(top: 40),
                            child: Text(
                              "No Record Found",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                  ),
            videoCall.length !=0 ?Column(
                children: call.map((data) =>  Container(
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
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Image.asset(
                                    "Assets/Images/c_chat_icon.png",
                                    height: 35,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Service Amount",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "Call for 00:00:26",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text('-\u{20B9} ${data["amount"]}',style: TextStyle( fontSize: 16,
                                    fontWeight: FontWeight.w500),),
                                Text(
                                  "19 Jun, 2020",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(margin: EdgeInsets.only(top: 20),child: Text("Paid by Wallet",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),)),

                    ],
                  ),
                ),).toList()
            ):Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("Assets/Icons/no_record_icon.png"),
                  Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Text(
                        "No Record Found",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("Assets/Icons/no_record_icon.png"),
                  Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Text(
                        "No Record Found",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("Assets/Icons/no_record_icon.png"),
                  Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Text(
                        "No Record Found",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ),


          ]),
        ),
      ),
    );
  }
}

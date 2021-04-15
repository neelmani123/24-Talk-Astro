import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_astro24/utils/setup.dart';

class MyWallet extends StatefulWidget {

  static const String myWallet = "/myWallet";


  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {

  TextEditingController _amountController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(pinkColor),
      appBar: AppBar(
        backgroundColor: Color(pinkColor),
        title: Text("My Wallet"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(blueGreyColor),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                ),
                height: 500,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Image.asset(
                          "Assets/Images/logo.png",
                          height: 120,
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      child: Text(
                        "Talk Astro 24",
                        style: TextStyle(
                            color: Color(
                              pinkColor,
                            ),
                            fontSize: 30,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        "ONLINE ASTROLOGY PREDICTIONS",
                        style: TextStyle(
                            color: Color(pinkColor),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset(
                              "Assets/Images/m_bullat.png",
                              height: 80,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    "Available Balance",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 21),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "\u{20B9}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 35),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "500",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 35,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: ()
                            {
                              if(_amountController.text.length==0)
                                {
                                  _amountController.text = 1000.toString();

                                }


                              else
                                {
                                  _amountController.text = (double.parse(_amountController.text) + 1000).toString();
                                }

                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(pinkColor)),
                              child: Text(
                                '+ \u{20B9}1,000',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: ()
                            {
                              if(_amountController.text.length==0)
                              {
                                _amountController.text = 5000.toString();

                              }


                              else
                              {
                                _amountController.text = (double.parse(_amountController.text) + 5000).toString();
                              }

                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(blueGreyColor)),
                              child: Text(
                                '+ \u{20B9}5,000',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if(_amountController.text.length==0)
                              {
                                _amountController.text = 10000.toString();

                              }


                              else
                              {
                                _amountController.text = (double.parse(_amountController.text) + 10000).toString();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Text(
                                '+ \u{20B9}10,000',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 20, bottom: 10),
                            width: double.infinity,
                            child: Text(
                              "Add Money to wallet",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: _amountController,
                            onChanged: (val)
                            {

                              var textFieldValue = val;

                              if(textFieldValue == "")
                                {
                                  return null;
                                }
                              else if(textFieldValue.isNotEmpty)
                                {

                                }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Enter Amount",
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            "Note: You can add Min. INR 10/-",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  // _bottomSheet(context);

                  if(_amountController.text.length !=0)
                    {
                      _showDialogBox(context);
                    }
                  else
                    {
                      return null;
                    }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 95),
                  child: Text(
                    "ADD MONEY",
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
              ), //Lo
            ],
          ),
        ),
      ),
    );
  }
}

_showDialogBox(context)
{
  return showDialog(context: context, builder: (BuildContext c) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Assets/Images/background.png"),
              fit: BoxFit.fitWidth),
        ),
        height: 400,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
                child: Image.asset(
                  "Assets/Images/payumoney_logo.png",
                  height: 25,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
                child: Image.asset(
                  "Assets/Images/paytm_icon.png",
                  height: 25,
                ),
              ),
              SizedBox(height: 40,),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 75),
                  child: Text(
                    "CANCEL",
                    style: TextStyle(color: Colors.white, fontSize: 15),
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
  });
}

// _bottomSheet(context) {
//   showModalBottomSheet(
//       context: context,
//       builder: (BuildContext c) {
//         return Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("Assets/Images/background.png"),
//                 fit: BoxFit.fitWidth),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 40),
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey,
//                       offset: Offset(0.0, 1.0), //(x,y)
//                       blurRadius: 4.0,
//                     ),
//                   ],
//                 ),
//                 child: Image.asset(
//                   "Assets/Images/payumoney_logo.png",
//                   height: 25,
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 40),
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey,
//                       offset: Offset(0.0, 1.0), //(x,y)
//                       blurRadius: 4.0,
//                     ),
//                   ],
//                 ),
//                 child: Image.asset(
//                   "Assets/Images/paytm_icon.png",
//                   height: 25,
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   _bottomSheet(context);
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 95),
//                   child: Text(
//                     "CANCEL",
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                     textAlign: TextAlign.center,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Color(blueGreyColor),
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey,
//                         offset: Offset(0.0, 1.0), //(x,y)
//                         blurRadius: 2.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       });
// }


// Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage("Assets/Images/background.png"),
// fit: BoxFit.fitWidth),
// ),
// child: Column(
// children: [
// Container(
// margin: EdgeInsets.symmetric(horizontal: 40),
// width: double.infinity,
// padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.white,
// boxShadow: [
// BoxShadow(
// color: Colors.grey,
// offset: Offset(0.0, 1.0), //(x,y)
// blurRadius: 4.0,
// ),
// ],
// ),
// child: Image.asset(
// "Assets/Images/payumoney_logo.png",
// height: 25,
// ),
// ),
// Container(
// margin: EdgeInsets.symmetric(horizontal: 40),
// width: double.infinity,
// padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.white,
// boxShadow: [
// BoxShadow(
// color: Colors.grey,
// offset: Offset(0.0, 1.0), //(x,y)
// blurRadius: 4.0,
// ),
// ],
// ),
// child: Image.asset(
// "Assets/Images/paytm_icon.png",
// height: 25,
// ),
// ),
// InkWell(
// onTap: () {
// _bottomSheet(context);
// },
// child: Container(
// padding: EdgeInsets.symmetric(vertical: 15, horizontal: 95),
// child: Text(
// "CANCEL",
// style: TextStyle(color: Colors.white, fontSize: 16),
// textAlign: TextAlign.center,
// ),
// decoration: BoxDecoration(
// color: Color(blueGreyColor),
// borderRadius: BorderRadius.circular(10),
// boxShadow: [
// BoxShadow(
// color: Colors.grey,
// offset: Offset(0.0, 1.0), //(x,y)
// blurRadius: 2.0,
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// );
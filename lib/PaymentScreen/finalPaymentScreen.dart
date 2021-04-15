import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_astro24/PaymentScreen/orderSucessFullScreen.dart';
import 'package:online_astro24/utils/setup.dart';


class FinalPaymentScreen extends StatefulWidget {
  static const String finalPaymentScreen = "/finalCheckoutScreen";

  @override
  _FinalPaymentScreenState createState() => _FinalPaymentScreenState();
}

class _FinalPaymentScreenState extends State<FinalPaymentScreen> {
  int selectedRadio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PAYMENT"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/Images/background.png"),
                fit: BoxFit.fitWidth)),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            "Select Payment Method",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w500),
                          )),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedRadio = 1;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(blueGreyColor))),
                          child: ListTile(
                            title: Text(
                              "Debit/ Credit Card/ Net Banking",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            trailing: Radio(
                                activeColor: Color(pinkColor),
                                value: 1,
                                groupValue: selectedRadio,
                                onChanged: (val) {
                                  setSelectedRadio(val);
                                }),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedRadio = 2;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(blueGreyColor))),
                          child: ListTile(
                              title: Text(
                                "Pay With Paytm",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              trailing: Radio(
                                  activeColor: Color(pinkColor),
                                  value: 2,
                                  groupValue: selectedRadio,
                                  onChanged: (val) {
                                    setSelectedRadio(val);
                                  })),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedRadio = 3;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(blueGreyColor))),
                          child: ListTile(
                            title: Text(
                              "Pay with Wallet",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            trailing: Radio(
                                activeColor: Color(pinkColor),
                                value: 3,
                                groupValue: selectedRadio,
                                onChanged: (val) {
                                  setSelectedRadio(val);
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Payment Summary",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Divider(
                        color: Color(blueGreyColor),
                        thickness: 1,
                      ),
                      Container(
                        height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    child: Text(
                                  "Service Amount",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                )),
                                Text(
                                  "GST@5%",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Amount Payble",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Rs.150.00",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Rs.50.00",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Rs.10,800/-",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    width: double.infinity,
                    color: Color(blueGreyColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Pay",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          "Rs.10,800/-",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )
                      ],
                    ))
              ],
            )),
            InkWell(
              onTap: () {

                Navigator.pushReplacementNamed(context, OrderSuccessFullScreen.orderSuccessScreen);
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Text(
                  "PAY NOW",
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
    );
  }
}

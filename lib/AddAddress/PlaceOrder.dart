import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_astro24/utils/setup.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:online_astro24/Successfull.dart';

class PlaceOrder extends StatefulWidget {
  String address_id;
  PlaceOrder({this.address_id});
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  bool _isLoading=true;
  String userId1 = '';
  String addressName="",mobile="",name="",locality="",type="",pincode="";
  int _value2 = 1;

  Future placeOrder()async
  {
    setState(() {
      _isLoading=true;
    });
    final _prefs = await SharedPreferences.getInstance();
    userId1 = _prefs.getString('userID') ?? '';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final res = jsonEncode({
      "user_id": userId1,
      "address_id":widget.address_id
    });
    var response = await http.post(
        "https://talkastro.devclub.co.in/userapi/checkout",
        headers: headers,
        body: res);
    Map data = json.decode(response.body);
    var status=data['status'];
    var address=data['address'];
    if(status==true)
      {
        setState(() {
          _isLoading=false;
          addressName=address['address'];
         mobile=address['mobile'];
         name=address['home'];
         locality=address['locality'];
         type=address['type'];
         pincode=address['pincode'];
        });
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    placeOrder();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order Details"),),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: _isLoading?Container(child: Center(child: CircularProgressIndicator(),),):ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(pinkColor),
                          )),
                      margin: EdgeInsets.only(top: 20,left: 10,right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address:",style: TextStyle(fontSize: 18.0),),
                          SizedBox(height: 10,),
                          Text(name??''),
                          Text(addressName??''),
                          Text(locality??''),
                          Text(type??''),
                          Text(pincode??''),

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 200,
                      padding: EdgeInsets.all(5),
                      child: Card(
                        elevation: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text('   Select payment Method',style: TextStyle(fontSize: 18,color: Colors.black),),
                            SizedBox(height: 20,),
                            Container(
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Color(pinkColor),
                                  )),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                               children: [
                                 Container(
                                   child: Text(
                                       'Pay with Paytm',style: TextStyle(fontSize: 16,color: Colors.black),
                                   ),
                                 ),
                                 Spacer(),
                                 Radio(
                                   activeColor: Color(pinkColor),
                                     value: 1, groupValue: _value2, onChanged: (int value){
                                   setState(() {
                                     _value2=value;
                                   });
                                 })
                               ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Color(pinkColor),
                                  )),
                               margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                               children: [
                                 Container(
                                   child: Text(
                                       'Cash on Delivery',style: TextStyle(fontSize: 16,color: Colors.black),
                                   ),
                                 ),
                                 Spacer(),
                                 Radio(
                                   activeColor: Color(pinkColor),
                                     value: 1, groupValue: 1, onChanged: (val){
                                   setState(() {
                                     val=val;
                                   });
                                 })
                               ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Payment details card
                    Container(
                      height: 200,
                      padding: EdgeInsets.all(5),
                      child: Card(
                        elevation: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text('   Price Details',style: TextStyle(fontSize: 18,color: Colors.black),),
                            SizedBox(height: 20,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      'Actual Price(1 service)',style: TextStyle(fontSize: 16,color: Colors.black),
                                    ),
                                  ),
                                  Spacer(),
                                  Text("Rs 1800")
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      'Safety & hygience charges',style: TextStyle(fontSize: 16,color: Colors.black),
                                    ),
                                  ),
                                  Spacer(),
                                  Text("Rs 59")
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      'Distance Fee',style: TextStyle(fontSize: 16,color: Colors.black),
                                    ),
                                  ),
                                  Spacer(),
                                  Text("Rs 0")
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      'Total Saving',style: TextStyle(fontSize: 16,color: Color(pinkColor)),
                                    ),
                                  ),
                                  Spacer(),
                                  Text("Rs 906",style: TextStyle(color: Color(pinkColor)),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        print("Address id Is:${widget.address_id}");
                        setState(() {
                           //_isLoading = true;
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Successfull()));
                      },

                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            top: 20,
                            bottom: 10,
                            left: 20,
                            right: 20
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                        child:Text(
                          "Book Now",
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
                )
            )
          ],
        ),
      )
    );

  }
}

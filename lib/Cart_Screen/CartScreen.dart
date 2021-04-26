import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_astro24/AddAddress/AddAddressScreen.dart';
import 'package:online_astro24/providers/cart.dart';
import 'package:online_astro24/utils/cartIteam.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  static const String cartScreen = "/CartScreen";


  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String userId1="";
  List details=[];
  bool _isLoading=true;

  
  Future getCardDetails()async{
    final _prefs = await SharedPreferences.getInstance();
    userId1 = _prefs.getString('userID') ?? '';
    Map<String,String>headers={'Content-Type':'application/json'};
    final res=jsonEncode({"user_id":userId1,});
    var response=await http.post("https://talkastro.devclub.co.in/userapi/cart_list",headers: headers,body: res);
    Map data=json.decode(response.body);
    var status=data['status'];
    print(status);
    if(status==true)
      {

        details=data['carts'] as List;
        var productdetails=details[0]['cartID'];
        print(productdetails);
        setState(() {
          _isLoading=false;
        });
      }
    
  }
  @override
  void initState() {
    // TODO: implement initState
    getCardDetails();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

   List myCart = [
     "text",
     "text",
   ];
    return Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
        ),
        body: _isLoading?Container(child: Center(child: CircularProgressIndicator(),),):
             Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: details.length,
                        itemBuilder: (ctx,i)
                        {
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
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
                            child: Container(
                              margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Image.network(
                                      details[i]['product_details']['image'],
                                      height: 70,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            '\u{20B9} ${details[i]['actual_price']} /-',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                          ),
                                          margin: EdgeInsets.only(bottom: 8),
                                        ),
                                        Container(
                                          child: Text(details[i]['product_details']['product_name']),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                padding: EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                    color: Color(pinkColor),
                                                    borderRadius:
                                                    BorderRadius.circular(20)),
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                )),
                                            Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Text(
                                                  details[i]['qty']??'',
                                                  style: TextStyle(
                                                      color: Color(pinkColor),
                                                      fontSize: 18),
                                                )),
                                            Container(
                                                padding: EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                    color: Color(pinkColor),
                                                    borderRadius:
                                                    BorderRadius.circular(20)),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                )),
                                          ],
                                        ),
                                        /*InkWell(
                    onTap: () {
                      cartBottomSheet(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.grey,
                          ),
                          Text(
                            "Remove",
                            style:
                            TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  )*/
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(vertical: 5),
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey,
                    //         offset: Offset(0.0, 1.0), //(x,y)
                    //         blurRadius: 4.0,
                    //       ),
                    //     ],
                    //   ),
                    //   child: Container(
                    //     margin:
                    //     EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Expanded(
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text("Delivery at : office",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),),
                    //
                    //               Container(margin: EdgeInsets.only(top: 5),child: Text("B-817, Noida One, Sector-62, Noida-201309")),
                    //
                    //             ],
                    //           ),
                    //         ),
                    //         Container(
                    //           child: Text("Change",style: TextStyle(color: Color(pinkColor),fontWeight: FontWeight.w500),),
                    //         ),
                    //
                    //
                    //       ],
                    //     ),
                    //   ),
                    // ),     // address
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
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
                      child: Container(
                        margin:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: Container(margin: EdgeInsets.only(right: 40),child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(blueGreyColor)),
                                ),
                                hintText: "Avail coupon discount",
                              ),
                            ))),
                            Text("Apply Now",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),)

                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                          "Item total",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    Text(
                                      "Delivery charges",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "GST",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Total Pay",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w800),
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
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Rs.150.00",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Rs.50.00",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Rs.10,800/-",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => AddAddress()));
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 10, right: 10, ),
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        child: Text(
                          "Continue",
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
              )
            /*: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        "Assets/Images/c_cart.png",
                        height: 300,
                      ),
                      height: 120,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Your cart is empty",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Add somthing to make me happy :)",
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
              )*/
    );
  }
}

void cartBottomSheet(context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      context: context,
      builder: (ctx) {
        return Container(
          height: 350,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(pinkColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "Remove an item",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Are you sure want to remove item from your shopping cart?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 21),
                    )),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: ()
                      {
                        Navigator.pop(context);
                      },
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          decoration: BoxDecoration(color: Color(0xFFF5F5F5),borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "NO",
                            style: TextStyle(color: Colors.lightGreen),
                          )),
                    ),
                    InkWell(
                      onTap: ()
                      {

                      },
                      child: Container(
                          decoration: BoxDecoration(color: Color(pinkColor),borderRadius: BorderRadius.circular(10)),

                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          child: Text("REMOVE",style: TextStyle(color: Colors.white),)),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
}

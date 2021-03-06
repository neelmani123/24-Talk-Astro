import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_astro24/Cart_Screen/CartScreen.dart';
import 'package:online_astro24/Widgets/productIteam.dart';
import 'package:online_astro24/providers/cart.dart';
import 'package:online_astro24/providers/products.dart';
import 'package:online_astro24/utils/badge.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CategoryMall extends StatefulWidget {
  final String id;
  final String text;

  CategoryMall({this.id, this.text});



  @override
  _CategoryMallState createState() => _CategoryMallState();
}

class _CategoryMallState extends State<CategoryMall> {
  bool _isLoading=true;
  List details1=[];
 String quantity="";
  bool _status=false;

  //Api for the categoryMall Details
  Future getCategory_details() async
  {
    final _prefs = await SharedPreferences.getInstance();
    print("Qtycskhck${quantity}");
    Map<String,String>headers={'Content-Type':'application/json'};
    final res=jsonEncode({"categoryID":widget.id});
    var response=await http.post("https://talkastro.devclub.co.in/userapi/get_category_product",
        headers:headers, body: res);
    Map data=json.decode(response.body);
    setState(() {
      quantity = _prefs.getString('qty1') ?? '';
       details1=data['category'] as List;
       print("Details Is:${details1}");
       details1.add(details1);
       _isLoading=false;
      });
  }
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      getCategory_details();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  //  final productData = Provider.of<Products>(context);
    //final products = productData.items();

    return Scaffold(
      appBar: AppBar(
        title:  Text(
          widget.text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Badge(child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => CartScreen()));
          }), value: "1",color: Color(blueGreyColor),),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/Images/background.png"))),
        child: SafeArea(
          child: Column(
            children: [
              InkWell(
                onTap: () {

                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(blueGreyColor),
                  ),
                  margin: const EdgeInsets.only(
                      left: 12.0, right: 12.0, bottom: 20.0, top: 10),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Search...",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      )),
                ),
              ),
              _isLoading?Container(child: Center(
                child: CircularProgressIndicator(),
              ),):Expanded(
                child: ListView(
                  children: [
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.72),
                      itemCount: details1.length-1,
                      itemBuilder: (BuildContext context, int index) => ProductItem(id: details1[index]['productID'], title: details1[index]['meta_title'], imageUrl: details1[index]['image'], price: details1[index]['actual_price']),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


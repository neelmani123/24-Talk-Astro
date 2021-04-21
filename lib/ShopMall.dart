import 'package:flutter/material.dart';
import 'package:online_astro24/CategoryShopMall.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class ShoppingMall extends StatefulWidget {

  @override
  _ShoppingMallState createState() => _ShoppingMallState();
}

class _ShoppingMallState extends State<ShoppingMall> {
  bool _isLoading=true;
  final List<Map<String, String>> shopping = [
    {"id": "a3", "images": "Assets/Images/red_panna.png", "text": "Red Panna"},
    {"id": "a1", "images": "Assets/Images/gemstone.png", "text": "Gemstone"},
    {"id": "a2", "images": "Assets/Images/rudraksh.png", "text": "Rudraksh"},
    {"id": "a2", "images": "Assets/Images/moti.png", "text": "Yantra"},
    {"id": "a3", "images": "Assets/Images/red_panna.png", "text": "Red Panna"},
    {"id": "a1", "images": "Assets/Images/gemstone.png", "text": "Gemstone"},
    {"id": "a2", "images": "Assets/Images/rudraksh.png", "text": "Rudraksh"},
    {"id": "a2", "images": "Assets/Images/moti.png", "text": "Yantra"},
  ];
  List details = [];

  Future getShopdetails() async
  {
    var response = await http.get(
        "https://talkastro.devclub.co.in/userapi/get_shop_category");
    Map data = json.decode(response.body);
    var respon = data['result'];
    details = data['category'] as List;
    print(details);
    setState(() {
      details.add(data);
      _isLoading=false;
    });
  }
@override
  void initState() {
    // TODO: implement initState
  getShopdetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View All"),
        backgroundColor: Color(pinkColor),
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage("Assets/Images/background.png"))),
        child: Column(
          children: [
            Container(
              color: Color(pinkColor),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(
                      left: 12.0, right: 12.0, bottom: 20.0, top: 10),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Search..",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ],
                      )),
                ),
              ),
            ), // search
            _isLoading?Container(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator()
              ],
            )):Expanded(
                child: ListView.builder(
              itemCount: details==null?Container():details.length-1,
                itemBuilder: (BuildContext context,int index){
                return Container(
                  decoration: BoxDecoration(color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 4.0,
                      ),
                    ],
                  ),

                  margin: EdgeInsets.only(right: 5, left: 5, top: 10),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (ctx) =>
                              CategoryMall(
                                id: details[index]['categoryID'],text: details[index]['categoryname'],))
                      );
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Image.network(
                                  details[index]['image'], height: 85,),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 25),
                                child: Text(details[index]['categoryname'], style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),),
                              ),
                            ],
                          ),
                          Container(
                            child: Icon(Icons.arrow_forward_ios,
                              color: Color(pinkColor),),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
                })),
          ],
        ),
      ),
    );
  }
}



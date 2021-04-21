import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_astro24/AstroDetailsScreen.dart';
import 'package:online_astro24/Chat_With_Astro/chatScreen.dart';
//import 'file:///C:/Users/JaiTuteja/AndroidStudioProjects/online_astro24/lib/Chat_With_Astro/chatScreen.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ChatNowScreen extends StatefulWidget {

  static const String chatNow = "chatNowScreen";

  @override
  _ChatNowScreenState createState() => _ChatNowScreenState();
}

class _ChatNowScreenState extends State<ChatNowScreen> {
  List details=[];
  String user_id="";
  String _deviceType = 'WEB';
  bool _isLoading=true;
  @override
  void initState() {
    // TODO: implement initState
    getAstroList();
    super.initState();
  }

  Future getAstroList() async
  {
    final _prefs = await SharedPreferences.getInstance();
    user_id = _prefs.getString('userID') ?? '';
    Map<String,String>headers={'Content-Type':'application/json'};
    final res=jsonEncode({"user_id":user_id,"type":"chat"});
    var response=await http.post("https://talkastro.devclub.co.in/userapi/astrologer_list",
        headers:headers, body: res);
    String res1=response.body;
    Map data=json.decode(response.body);
    var respon=data['result'];
    details=data['astrologer'] as List;
    //print(response.body);
    setState(() {
      details.add(data);
      print(details.length);
      _isLoading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(pinkColor),
        title: Text("Chat Now"),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/Images/background.png"),fit: BoxFit.fitWidth)),
        child: _isLoading?Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ):ListView.builder(
            itemCount: details==null?Container(
            ):details.length-1,
            itemBuilder: (BuildContext context,int index){
              return Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 4.0,
                    ),
                  ],),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => AstroDetailsScreen()));
                              },
                              child: Column(
                                children: [
                                  Image.network(
                                    "${details[index]['profile']}",
                                    height: 55,
                                  ),
                                  Text(details[index]['real_name']),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset(
                                    "Assets/Images/stars.png",
                                    height: 25,
                                  ),
                                  Text("2472 total"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: ()
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (ctx) => AstroDetailsScreen()));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "Assets/Images/tarot.png",
                                        height: 25,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(child: Text(details[index]['skill']))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "Assets/Images/experience.png",
                                        height: 25,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text("${details[index]['experience']} Years experience"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "Assets/Images/language.png",
                                        height: 19,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(details[index]['language']),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "Assets/Images/rupees_icon.png",
                                        height: 25,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text("599/- Only Per Mint."),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (ctx) => ChatScreen()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            right: 30,
                            top: 20,
                          ),
                          width: 160,
                          padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          alignment: Alignment.bottomRight,
                          decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "Assets/Images/chat.png",
                                height: 27,
                              ),
                              Text(
                                "CHAT NOW",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            })
      ),
    );
  }
}

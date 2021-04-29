import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class QuestionHistory extends StatefulWidget {
  static const String questionHistory = "questionHistory";

  @override
  _QuestionHistoryState createState() => _QuestionHistoryState();
}

class _QuestionHistoryState extends State<QuestionHistory> {
  String userId1="";
  List details=[];
  bool _isLoading=true;

  Future getAskQuestion()async{
    final _prefs = await SharedPreferences.getInstance();
    userId1 = _prefs.getString('userID') ?? '';
    Map<String,String>headers={'Content-Type':'application/json'};
    final res=jsonEncode({"user_id":userId1,});
    var response=await http.post("https://talkastro.devclub.co.in/userapi/ask_question_history",headers: headers,body: res);
    Map data=json.decode(response.body);
    var status=data['status'];
    print(status);

    if(status==true)
    {
      details=data['questions'] as List;
      setState(() {
        _isLoading=false;
      });
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    getAskQuestion();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question History"),
      ),
      body: _isLoading?Container(
        child: Center(child: Text("No Data Found"),),
      ):Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/Images/background.png"),
                fit: BoxFit.fitWidth)),
        child: ListView.builder(
          itemCount: details.length,
            itemBuilder: (BuildContext context,int i){
          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 4.0,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ask Question",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 21,
                            ),
                          ),
                          Text(
                            "Pending",
                            style: TextStyle(color: Color(pinkColor)),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(details[i]['data']['name']??''),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text(details[i]['data']['dob']??''),
                                  Text(details[i]['data']['birth_time']??'')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey,thickness: 1,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("Name",style: TextStyle(fontWeight: FontWeight.w500),),
                                SizedBox(height: 5,),
                                Text(details[i]['data']['name']??'',style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Gender",style: TextStyle(fontWeight: FontWeight.w500),),
                                SizedBox(height: 5,),
                                Text(details[i]['data']['gender']??'',style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Place of Birth",style: TextStyle(fontWeight: FontWeight.w500),),
                                SizedBox(height: 5,),
                                Text(details[i]['data']['birth_place']??'',style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Time of Birth",style: TextStyle(fontWeight: FontWeight.w500),),
                                SizedBox(height: 5,),
                                Text(details[i]['data']['birth_time']??'',style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Question",style: TextStyle(fontWeight: FontWeight.w500),),
                                SizedBox(height: 5,),
                                Text(details[i]['text']??'',style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(top: 5,bottom: 5),
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                    child: Text(
                      "Still Our Astrologer Working on Your Question",
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
            ),
          );
        })
      ),
    );
  }
}

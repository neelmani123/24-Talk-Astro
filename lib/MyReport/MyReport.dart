import 'package:flutter/material.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyReport extends StatefulWidget {
  @override
  _MyReportState createState() => _MyReportState();
}

class _MyReportState extends State<MyReport> {
  String userId1="";
  List details=[];
  bool _isLoading=true;
  Future getReport()async{
    final _prefs = await SharedPreferences.getInstance();
    userId1 = _prefs.getString('userID') ?? '';
    Map<String,String>headers={'Content-Type':'application/json'};
    final res=jsonEncode({"user_id":userId1,});
    var response=await http.post("https://talkastro.devclub.co.in/userapi/report_history",headers: headers,body: res);
    Map data=json.decode(response.body);
    var status=data['status'];
    print(status);

    if(status==true)
    {
      details=data['reports'] as List;
      setState(() {
        _isLoading=false;
      });
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    getReport();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Report"),
      ),
      body: _isLoading?Container(
        child: Center(child: Text("No Data Found"),),
      ):Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("Assets/Images/background.png"),
                  fit: BoxFit.fitWidth)),
          child: ListView.builder(
              itemCount: details.length=1,
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
                                  "Report Name",
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
                                    child: Text(details[i]['report_details']['report_name']??''),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(details[i]['dob']??''),
                                        Text(details[i]['tob']??'')
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
                                      Text(details[i]['name']??'',style: TextStyle(color: Colors.grey),),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Gender",style: TextStyle(fontWeight: FontWeight.w500),),
                                      SizedBox(height: 5,),
                                      Text(details[i]['gender']??'',style: TextStyle(color: Colors.grey),),
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
                                      Text(details[i]['pob']??'',style: TextStyle(color: Colors.grey),),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Time of Birth",style: TextStyle(fontWeight: FontWeight.w500),),
                                      SizedBox(height: 5,),
                                      Text(details[i]['tob']??'',style: TextStyle(color: Colors.grey),),
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
                                      Text("Marital Status",style: TextStyle(fontWeight: FontWeight.w500),),
                                      SizedBox(height: 5,),
                                      Text(details[i]['marital_status']??'',style: TextStyle(color: Colors.grey),),

                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Contact Number",style: TextStyle(fontWeight: FontWeight.w500),),
                                      SizedBox(height: 5,),
                                      Text(details[i]['contact_no']??'',style: TextStyle(color: Colors.grey),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                     /* InkWell(
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
                      ),*/
                    ],
                  ),
                );
              })
      ),
    );
  }
}

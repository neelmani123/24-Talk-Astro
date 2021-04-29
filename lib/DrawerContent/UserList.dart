import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:online_astro24/DrawerContent/AddUserForm.dart';
import 'package:online_astro24/helper/api_heper.dart';
import 'package:online_astro24/httpHelper/httpHelper.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:online_astro24/Modal/UserListData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserList extends StatefulWidget {
  static const String userList = "userList";
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final dateFormat = DateFormat("dd-MM-yyyy");
  final timeFormat = DateFormat("HH:mm");
  DateTime currentVale = DateTime.now();
  bool _isLoading=true;
  List details=[];
  List<User> data=[];
 String userId1="";
  String _deviceType = 'WEB';
  HttpService _httpService = HttpService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserList();
   // getUserList1();
  }

 /* getUserList1()async
  {
    var res = await _httpService.userList(user_id:"30");
    print(res.name);
    print("Ddhgfjgjjgfs is:${res.toJson()}");
    setState(() {
   Map data=res.toJson();

    });
  }*/

  Future getUserList() async
  {
    final _prefs = await SharedPreferences.getInstance();
    userId1 = _prefs.getString('userID') ?? '';
    Map<String,String>headers={'Content-Type':'application/json'};
    final res=jsonEncode({"user_id":userId1});
    var response=await http.post("https://talkastro.devclub.co.in/userapi/user_profile",
        headers:headers, body: res);
    Map data=json.decode(response.body);
    //print(data);
    var respon=data['result'];
    //print(respon);
    details=data['user_profile'] as List;
    setState(() {
      details.add(data);
      print(details.length);
      _isLoading=false;
    });
  }
  //Add Dialog here
  createAlertDialog(BuildContext context,String name,String email,String dob,String gender,String time_birth)
  {
    final TextEditingController _nameController = TextEditingController();
    _nameController.text=name;
    final TextEditingController _emailController=TextEditingController();
    _emailController.text=email;
    final TextEditingController _gender = TextEditingController();
    _gender.text=gender;
    final TextEditingController _dob = TextEditingController();
    _dob.text=dob;
    final TextEditingController _time = TextEditingController();
    _time.text=time_birth;
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        scrollable: true,
        content: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(blueGreyColor)),
                  labelText: "Name",
                  hintText: 'Name',
                ),
              ),
              TextFormField(
                controller:_emailController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(blueGreyColor)),
                  labelText: "Email",
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 15,),
              DateTimeField(
                controller: _dob,
                decoration: InputDecoration(
                  hintText: "DATE OF BIRTH",
                  hintStyle: TextStyle(color: Colors.black),
                  // prefixIcon: Icon(
                  //   Icons.calendar_today_outlined, color: Colors.grey,)
                ),
                format: dateFormat,
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                },
              ),
              DateTimeField(
                controller: _time,
                decoration: InputDecoration(
                  // prefixIcon: Icon(
                  //   Icons.timer_sharp, color: Colors.grey,),
                  hintText: "TIME OF BIRTH",
                  hintStyle: TextStyle(color: Colors.black),
                ),
                format: timeFormat,
                onShowPicker: (context, currentValue) async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(
                        currentValue ?? DateTime.now()),
                  );
                  print(time);
                  return DateTimeField.convert(time);
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: ()
                  {
                    showDialog(
                        context: context,
                        builder: (_) {
                          int selectedRadio;
                          return AlertDialog(
                            title: Text(
                              'Select Gender', textAlign: TextAlign.center,),
                            content: StatefulBuilder(
                                builder: (BuildContext context,StateSetter setState)
                                {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Radio(value: 0,
                                                    groupValue: selectedRadio,
                                                    onChanged: (val) {
                                                      _gender.text = "Male";
                                                      setState(() => selectedRadio = val,
                                                      );
                                                    }),
                                                Text("Male"),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Radio(value: 1,
                                                    groupValue: selectedRadio,
                                                    onChanged: (val) {
                                                      _gender.text = "Female";
                                                      setState(() => selectedRadio = val);
                                                    }),
                                                Text("Female"),
                                              ],
                                            ),
                                          ),


                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                                child: Text("Cancel"),
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                                child: Text("OK"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  );
                                }
                            ),
                          );
                        }
                    );
                  },
                  child: IgnorePointer(
                    child: TextFormField(
                      controller: _gender,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Color(blueGreyColor)),
                        labelText: "Gender",
                        hintText: gender,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: ()  async{
                  setState(() {
                    _isLoading = true;
                  });
                  var res = await _httpService.edit_user_list(user_id:userId1,name: _nameController.text,date_of_birth: _dob.text, time_of_birth: _time.text, gender: _gender.text,email:_emailController.text);
                  if(res.result == "true")
                  {
                    print(res.message);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserList()),
                    );
                  }
                  else
                  {
                    print("SigUp fAILED");
                  }
                  setState(() {
                    _isLoading = false;
                  });
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      top: 20,
                      bottom: 20
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 95),
                  child: Text(
                    "SAVE",
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
        ),
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: Icon(Icons.close,size: 30,)),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Edit User"),
              )
            ],
          ),
        ),

      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        backgroundColor: Color(pinkColor),
      ),
      body:Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "Assets/Images/background.png",
                ),
                fit: BoxFit.fitWidth)),
        child: _isLoading?Container(
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          ),
        ):Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: details==null?Container():details.length-1,
                itemBuilder: (BuildContext context,int index)
                {
                  return  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 4.0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color: Color(outlineColor), width: 4)),
                          child: CircleAvatar(
                            child: Image.asset("Assets/Images/user_pic.png"),
                            radius: 32,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  details[index]['name']??'',
                                  style: TextStyle(
                                      color: Color(pinkColor),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19),
                                ),
                                Text(details[index]['relationship']??''),
                                Text(details[index]['gender']??''),
                                Text(details[index]['dob']??''),
                                Row(
                                  children: [
                                      Flexible(
                                      child: Text(
                                        details[index]['birth_place']??'',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                   // Text("New Delhi , India")
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Image.asset(
                            "Assets/Icons/edit_icon.png",
                            height: 20,
                          ),
                          onTap: (){
                            print(details[index]);
                            createAlertDialog(context,details[index]['name'],details[index]['email'],details[index]['dob'],details[index]['gender'],details[index]['birth_time']);
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => CreateUser()));
              },
              child: Container(
                width: 240,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(inActiveColor)),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(
                        child: Image.asset(
                      "Assets/Icons/add_icon.png",
                      height: 25,
                    )),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Add A New Member",
                          style: TextStyle(fontSize: 19),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

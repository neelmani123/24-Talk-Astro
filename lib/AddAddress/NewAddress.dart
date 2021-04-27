
import 'package:flutter/material.dart';
import 'package:online_astro24/AddAddress/AddAddressScreen.dart';
import 'package:online_astro24/Modal/GetProfileModal.dart';
import 'package:online_astro24/httpHelper/httpHelper.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;

class NewAddress extends StatefulWidget {
  @override
  _NewAddressState createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  HttpService _httpService = HttpService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _localityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  GetProfileModal profileData;
  bool _isLoading = true;
  String value1=null;
  List<DropdownMenuItem<String>> listDrop = [];
  List<DropdownMenuItem<String>> listDrop1 = [];
  String userId1="";
  var details;
  String selected,selected2=null;
  @override
  void initState() {
    // TODO: implement initState
    callWebService();
    statename();
    super.initState();
  }

  //State Name Api

  Future<String> statename()async{
    final _prefs = await SharedPreferences.getInstance();
    userId1 = _prefs.getString('userID') ?? '';
    Map<String,String>headers={'Content-Type':'application/json'};
    final res=jsonEncode({"user_id":userId1,});
    var response=await http.post("https://talkastro.devclub.co.in/userapi/state_list",headers: headers,body: res);
    Map data=json.decode(response.body);
    var status=data['status'];
    details=data["states"]as List;
    listDrop=[];
    if(status==true)
      {
        setState(() {
          _isLoading=false;
          for(int i=0;i<details.length;i++)
            {
              listDrop.add(new DropdownMenuItem(
                child: new Text(details[i]['name'],
                ),
                value: details[i]['id'],
              ));
            }
        });

      }
    return "Success";
  }

  //City Name Api
  Future cityName( String id) async{
    final _prefs = await SharedPreferences.getInstance();
    userId1 = _prefs.getString('userID') ?? '';
    Map<String,String>headers={'Content-Type':'application/json'};
    final res=jsonEncode({"user_id":userId1,"state_id":id});
    var response=await http.post("https://talkastro.devclub.co.in/userapi/city_list",headers: headers,body: res);
    Map data=json.decode(response.body);
    var status=data['status'];
   var  cityes=data["cities"]as List;

    listDrop1=[];
    if(status==true)
    {
      setState(() {
        for(int i=0;i<cityes.length;i++)
        {
          listDrop1.add(new DropdownMenuItem(
            child: new Text(cityes[i]['city'],
            ),
            value: cityes[i]['id'],
          ));
        }
      });

    }
  }

  callWebService() async {
    setState(() {
      _isLoading = true;
    });
    final prefs = await SharedPreferences.getInstance();
    var res = await _httpService.getProfile();
    if (res.result == "true") {
      profileData = res;
      _nameController.text = res.user.name;
      _mobileNumber.text = res.user.contact_no;
    } else {
      print("Profile Api Not Working");
      return;
    }

    setState(() {
      _isLoading = false;
    });
  }

  //Api Add Address

  Future addAddress()async{
    setState(() {
      _isLoading=true;
    });
    final _prefs = await SharedPreferences.getInstance();
    userId1 = _prefs.getString('userID') ?? '';
    Map<String,String>headers={'Content-Type':'application/json'};
    final res=jsonEncode({"user_id":userId1,
      "home":_nameController.text,
      "address":_addressController.text,
      "locality":_localityController.text,
      "pincode":_pincodeController.text,
      "mobile":_mobileNumber.text,
      "state_id":selected,
      "city_id":selected2,
      "type":value1
    });
    var response=await http.post("https://talkastro.devclub.co.in/userapi/add_address",headers: headers,body: res);
    Map data=json.decode(response.body);
    print("Add Address Details:${data}");
    var status=data['status'];
    if(status==true)
      {
        _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text("Successfully Added")));
        setState(() {
          _isLoading=false;
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>AddAddress()));
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Assets/Images/background.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Add Address"),
        ),
        body: _isLoading?Container(child: Center(child: CircularProgressIndicator(),),):SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Color(pinkColor)),
                        labelText: "Name",
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              //  color: Color(pinkColor),
                              ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(pinkColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      controller: _mobileNumber,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Color(pinkColor)),
                        labelText: "Mobile",
                        hintText: "Mobile",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              //  color: Color(pinkColor),
                              ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(pinkColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Color(pinkColor)),
                        labelText: "Address",
                        hintText: "Address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(pinkColor),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(pinkColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      controller: _localityController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Color(pinkColor)),
                        labelText: "Locality",
                        hintText: "Locality",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(pinkColor),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(pinkColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _pincodeController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Color(pinkColor)),
                        labelText: "Pincode",
                        hintText: "Pincode",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(pinkColor),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(pinkColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: Color(pinkColor),
                          )),
                      margin: EdgeInsets.only(top: 20),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: value1,
                          hint: Text(' Select Type',style: TextStyle(color: Color(pinkColor)),),
                          items: <String>['home','office','other'].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                                child: Text(value)
                            );
                          }).toList(),
                          iconSize: 30.0,
                          elevation: 16,
                          iconEnabledColor: Color(pinkColor),
                          onChanged: (val){
                            setState(() {
                              value1=val;
                              print(value1);
                            });
                          },
                        ),
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Color(pinkColor))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          isExpanded: true,
                          value: selected,
                          hint: new Text(
                            'Select State',
                            style: new TextStyle(
                              color: Color(pinkColor),
                              fontSize: 18.0,
                            ),
                          ),
                          items: listDrop,
                          iconSize: 30.0,
                          elevation: 16,
                          iconEnabledColor: Color(pinkColor),
                          onChanged: (value) {
                            setState(() {
                              selected = value;
                              cityName(selected);

                            });
                          }),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Color(pinkColor))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          isExpanded: true,
                          value: selected2,
                          hint: new Text(
                            'Select City',
                            style: new TextStyle(
                              color: Color(pinkColor),
                              fontSize: 18.0,
                            ),
                          ),
                          items: listDrop1,
                          iconSize: 30.0,
                          elevation: 16,
                          iconEnabledColor: Color(pinkColor),
                          onChanged: (value) {
                            setState(() {
                              selected2 = value;
                            });
                          }),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        _isLoading = true;
                      });

                      addAddress();
                    },
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        top: 40,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 95),
                      child:  _isLoading == true ? Container(height: 30,width: 20,child: CircularProgressIndicator()):Text(
                        "Add Address",
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
          ),
        ),
      ),
    );
  }
}

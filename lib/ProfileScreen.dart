import 'dart:convert';
import 'package:clipboard/clipboard.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:online_astro24/Modal/GetProfileModal.dart';
import 'package:online_astro24/httpHelper/httpHelper.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:share/share.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';
import 'package:dio/dio.dart';
//import 'package:path/path.dart';

class ProfileScreen extends StatefulWidget {
  static const String profile = "Profile";


  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {



  final formKey = new GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFiler;
  String profile;
  String userId1="";
  GetProfileModal profileData;
  HttpService _httpService = HttpService();
  bool isLoading;
  bool isLoading1;
  String imageUrl="";

  //Here get Image from Camera and Gallery
  void getImage(source) async {
    final pickerFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFiler = pickerFile;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("profile", _imageFiler.path);
  }
  //Here uploadImage Api from Dio Multipart
  Future _uploadImage()async
  {
    isLoading=true;
    final _prefs = await SharedPreferences.getInstance();
    userId1 = _prefs.getString('userID') ?? '';
    String fileName1 = _imageFiler.path.split('/').last;
    try {
      FormData formData = new FormData.fromMap({
        "user_id": userId1,
        "image":await  MultipartFile.fromFile(
            _imageFiler.path,filename: fileName1)
      });
      Response response = await Dio().post(
          "https://talkastro.devclub.co.in/userapi/edit_profile_photo",
          data: formData);
      print("File Upload Response $response");
      Map data=jsonDecode(response.data);
      var result=data['result'];
      var sms=data['message'];
      print("Result is:${result}");
      if(result=="success")
        {
          setState(() {
            isLoading=false;
            _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(sms)));
          });
        }
    } catch (e) {
      print("Exception caught $e");
    }
  }

  getDataFromPref() async {
    final prefs = await SharedPreferences.getInstance();
    profile = prefs.getString("profile");
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  callWebService() async
  {
    setState(() {
      isLoading = true;
    });
    final prefs = await SharedPreferences.getInstance();
    var res = await _httpService.getProfile();
    if(res.result == "true")
    {
      profileData = res;
      _nameController.text = res.user.name;
      _emailController.text = res.user.email;
      _dob.text = res.user.dob;
      _mobileNumber.text = res.user.contact_no;
      _timeOfBirth.text = res.user.birth_time;
      _gender.text = res.user.gender;
      imageUrl=res.user.image;
      setState(() {
        prefs.setString('image_url', imageUrl);
      });
    }
    else
    {
      print("Profile Api Not Working");
      return ;
    }

    setState(() {
      isLoading = false;
    });
  }




  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _timeOfBirth = TextEditingController();


  final dateFormat = DateFormat("yyyy-MM-dd");
  final timeFormat = DateFormat("HH:mm");
  DateTime currentVale = DateTime.now();



  @override
  void initState() {
    callWebService();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("Assets/Images/background.png"),fit: BoxFit.cover)),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: Color(pinkColor),
        ),
        body: isLoading == true ? Center(child: CircularProgressIndicator(),):SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: CircleAvatar(
                          radius: 52,
                          backgroundColor: Color(pinkColor),
                          child: CircleAvatar(
                              radius: 50,
                              backgroundImage: _imageFiler == null
                                  ? NetworkImage(imageUrl)
                                  : FileImage(File(_imageFiler.path))),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (builder) => bottomSheet());
                          },
                          child: Container(
                            child: Image.asset(
                              "Assets/Images/camera.png",
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(
                  //     top: 10,
                  //   ),
                  //   width: double.infinity,
                  //   child: Text(
                  //     "Edit Profile",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //         color: Color(pinkColor),
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.w600),
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Color(pinkColor)),
                        labelText: "Username",
                        hintText: "Username",
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
                    margin: EdgeInsets.only(top: 10),
                    child: IgnorePointer(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _mobileNumber,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Color(pinkColor)),
                          labelText: "Phone Number",
                          hintText: "Phone Number",
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
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Color(pinkColor)),
                        labelText: "Email",
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
                  InkWell(
                    onTap: () {
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
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          controller: _gender,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Color(pinkColor)),
                            labelText: "Gender",
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
                    ),
                  ),
                  SizedBox(height: 10,),
                  DateTimeField(
                    textInputAction: TextInputAction.next,
                    controller: _dob,
                    decoration: InputDecoration(
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
                        hintText: "DATE OF BIRTH",
                        labelStyle: TextStyle(color: Color(pinkColor)),
                        prefixIcon: Icon(
                          Icons.calendar_today_outlined, color: Colors.grey,)
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
                  SizedBox(height: 10,),
                  DateTimeField(
                    textInputAction: TextInputAction.next,
                    controller: _timeOfBirth,
                    decoration: InputDecoration(
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
                      prefixIcon: Icon(
                        Icons.timer_sharp, color: Colors.grey,),
                      hintText: "TIME OF BIRTH",
                      hintStyle: TextStyle(color: Colors.grey),
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
                  // Container(
                  //   margin: EdgeInsets.only(top: 10),
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       labelStyle: TextStyle(color: Color(pinkColor)),
                  //       labelText: "Address",
                  //       hintText: "Address",
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //         borderSide: BorderSide(
                  //           color: Color(pinkColor),
                  //         ),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //         borderSide: BorderSide(
                  //           color: Color(pinkColor),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () async {

                      setState(() {
                        isLoading1 = true;
                      });

                      await _httpService.updateProfile(name: _nameController.text,email: _emailController.text,dob: _dob.text,gender: _gender.text,timeOfBirth: _timeOfBirth.text);
                      _uploadImage();
                      setState(() {
                        isLoading1 = false;
                      });

                     // _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text("Updated Successfully")));


                    },
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        top: 40,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 95),
                      child:  isLoading1 == true ? Container(height: 30,width: 20,child: CircularProgressIndicator()):Text(
                        "Save As",
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
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 15, left: 10),
                            child: Text(
                              "Your Friends are our friends too!",
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w600),
                            )),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text("You unique referral code is",
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    color: Color(pinkColor)))),
                        Container(
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 20, bottom: 20),
                          child: DottedBorder(
                            color: Color(pinkColor),
                            strokeWidth: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          profileData.referal_code,
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 19),
                                        ),
                                        Container(
                                            child: IconButton(
                                                icon: Icon(
                                                  Icons.copy,
                                                  color: Colors.grey,
                                                ),
                                                onPressed: () {
                                                  FlutterClipboard.copy('GROGRY12');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Refferal code copies")));
                                                }))
                                      ],
                                    )),
                                InkWell(
                                  onTap: () {
                                    Share.share(
                                        'check out my website https://example.com');
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.share,
                                        color: Color(pinkColor),
                                      )),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
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

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            "Choose Profile photo",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: Icon(Icons.camera, color: Color(pinkColor)),
                onPressed: () {
                  getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                label: Text(
                  "Camera",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton.icon(
                icon: Icon(Icons.image, color: Color(pinkColor)),
                onPressed: () {
                  getImage(ImageSource.gallery);
                  Navigator.pop(context);

                },
                label: Text("Gallery",style: TextStyle(color: Colors.black),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
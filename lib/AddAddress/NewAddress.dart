import 'package:flutter/material.dart';
import 'package:online_astro24/Modal/GetProfileModal.dart';
import 'package:online_astro24/httpHelper/httpHelper.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewAddress extends StatefulWidget {
  @override
  _NewAddressState createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  HttpService _httpService = HttpService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _localityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  GetProfileModal profileData;
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    callWebService();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Assets/Images/background.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Add Address"),
        ),
        body: SingleChildScrollView(
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
                          hint: Text(' Select State'),
                          items: <String>['home','office','other'].map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem(
                              value: e,
                                child: Text(e)
                            );
                          }).toList(),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

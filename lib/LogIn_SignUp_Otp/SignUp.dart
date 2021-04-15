import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:online_astro24/LogIn_SignUp_Otp/Login.dart';
import 'package:online_astro24/LogIn_SignUp_Otp/OtpScreen.dart';
import 'package:online_astro24/httpHelper/httpHelper.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class SignUp extends StatefulWidget {

  final String mobileNumber;
  SignUp({@required this.mobileNumber});

  static const String signUp = "SignUpScreen";


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  // FORM KEY
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  // TEXT EDITING CONTROLLERS
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _time = TextEditingController();
  final TextEditingController _placeOfBirth = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _referralCode = TextEditingController();

  DateTime selectedDate = DateTime.now();
  HttpService _httpService = HttpService();
  bool isLoading;

  validate() {
    if (_formKey.currentState.validate()) {
      if(_dob.text.length ==0 || _time.text.length == 0 || _placeOfBirth.text.length ==0 || _gender.text.length==0)
        {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Please fill input fields'),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(pinkColor),
                          ),

                          onPressed: ()
                          {
                            Navigator.pop(context);
                          },
                          child: Text("Ok"),
                        )
                      ],
                    )

                  ],
                ),
              )
          );
        }
      else
        {
         _callWebService();
        }
    }

  }

  _callWebService()async
  {

    setState(() {
      isLoading = true;
    });

    var res = await _httpService.signUpModal(name: _nameController.text, email: _emailController.text, mobileNumber: _mobileNumber.text, dob: _dob.text, timeOfBirth: _time.text, placeOfBirth: _placeOfBirth.text, gender: _gender.text);
    if(res.result == "success")
      {

          await Navigator.push(context, MaterialPageRoute(builder: (ctx) => OtpScreen(mobileNumber: _mobileNumber.text)));
      }

    else
      {
        print("SigUp fAILED");
      }
    setState(() {
      isLoading = false;
    });




  }





  //timer Format
  final dateFormat = DateFormat("yyyy-MM-dd");
  final timeFormat = DateFormat("HH:mm");
  DateTime currentVale = DateTime.now();




  // Initial LOCATION
  PickResult selectedPlace;
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);


  setMobile()
  {
    setState(() {
      _mobileNumber.value = TextEditingValue(text: widget.mobileNumber);
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setMobile();

  }
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(pinkColor).withOpacity(0),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15,),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Create Account",
                      style:
                      TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Name Required"),
                      MaxLengthValidator(30, errorText: "Enter Valid Name"),
                      MinLengthValidator(2,
                          errorText: "Name should be minimum 3 character"),
                    ]),
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "FULL NAME",
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.grey,
                        size: 25,
                      ),
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty ||
                          !RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "EMAIL ADDRESS",
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                        size: 25,
                      ),
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    textInputAction: TextInputAction.next,

                  ),
                  TextFormField(
                    readOnly: true,
                    maxLength: 10,
                    controller: _mobileNumber,
                    validator: MultiValidator([
                      MinLengthValidator(10, errorText: "Enter a valid number"),
                      RequiredValidator(errorText: "Phone no required"),
                    ]),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "MOBILE NUMBER",
                      prefixText: "+91",
                      prefixIcon: Icon(
                        Icons.call,
                        color: Colors.grey,
                        size: 25,
                      ),
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  DateTimeField(
                    textInputAction: TextInputAction.next,
                    controller: _dob,
                    decoration: InputDecoration(
                        hintText: "DATE OF BIRTH",
                        hintStyle: TextStyle(color: Colors.grey),
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
                  SizedBox(height: 4,),
                  DateTimeField(
                    textInputAction: TextInputAction.next,
                    controller: _time,
                    decoration: InputDecoration(
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PlacePicker(
                              apiKey: apiKey,
                              initialPosition: kInitialPosition,
                              useCurrentLocation: true,
                              selectInitialPosition: true,

                              //usePlaceDetailSearch: true,
                              onPlacePicked: (result) {
                                selectedPlace = result;
                                Navigator.of(context).pop();
                                setState(() {});
                                _placeOfBirth.text =
                                    selectedPlace.formattedAddress;
                              },

                            );
                          },
                        ),
                      );
                    },
                    child: IgnorePointer(
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: _placeOfBirth,
                        decoration: InputDecoration(
                          labelText: "PLACE OF BIRTH",
                          prefixIcon: Icon(
                            Icons.place_outlined,
                            color: Colors.grey,
                            size: 25,
                          ),
                          labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
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
                      child: TextFormField(
                        controller: _gender,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "SELECT GENDER",
                          prefixIcon: Icon(
                            Icons.person_search_sharp,
                            color: Colors.grey,
                            size: 25,
                          ),
                          labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    onFieldSubmitted: (_) => node.unfocus(),
                    controller: _referralCode,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: "REFERRAL CODE",
                      prefixIcon: Icon(
                        Icons.local_offer,
                        color: Colors.grey,
                        size: 25,
                      ),
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: ()
                        {
                          validate();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 35),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 95),
                          child: isLoading == true ?  Container(height: 20,width:20,child: CircularProgressIndicator(backgroundColor: Colors.white,)):Text(
                            "SIGN UP",
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
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "Already have a account ?",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            SizedBox(width: 5,),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (ctx) => Login()));
                              },
                              child: Container(
                                child: Text("sign in", style: TextStyle(
                                    color: Color(pinkColor), fontSize: 15),),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
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

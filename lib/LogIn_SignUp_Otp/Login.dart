import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_astro24/Home.dart';
import 'package:online_astro24/LogIn_SignUp_Otp/OtpScreen.dart';
import 'package:online_astro24/LogIn_SignUp_Otp/SignUp.dart';
import 'package:online_astro24/Modal/SendOtpModal.dart';
import 'package:online_astro24/httpHelper/httpHelper.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static const String login = "LogInScreen";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController mobileNumber = TextEditingController();

  HttpService _httpService = HttpService();
  bool isLoading;
  SendOtpModal _sendOtpModal;
  String  getOtp;
  String userOtp;

  _callWebService() async {
    setState(() {
      isLoading = true;
    });

    var sendOtpModalData = await _httpService.otpFetch(mobileNumber: mobileNumber.text);

    if (sendOtpModalData.result == "success")
    {
        if(sendOtpModalData.type == "new")
          {
            // SharedPreferences _pref = await SharedPreferences.getInstance();
            // _pref.setString("userID", sendOtpModalData.user.userID);
            // _pref.setString("name", sendOtpModalData.user.name);
            // _pref.setString("country_code", sendOtpModalData.user.country_code);
            // _pref.setString("phone", sendOtpModalData.user.phone);
            // _pref.setString("email", sendOtpModalData.user.email);
            // _pref.setString("image", sendOtpModalData.user.image);
            await Navigator.push(context,MaterialPageRoute(builder: (ctx) =>SignUp(mobileNumber: mobileNumber.text)));
          }
        else if(sendOtpModalData.type == "old")
          {
            await Navigator.push(context,MaterialPageRoute(builder: (ctx) => OtpScreen(mobileNumber: mobileNumber.text,)));
          }

    }
    else
      {
        return null;
      }
    setState(() {
      isLoading = false;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Image.asset(
                  "Assets/Images/mobile_login_cuate.png",
                  height: 250,
                ),
              ), //images
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome!",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Color(blueGreyColor)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Enter your mobile number to continue",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ), //
              Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 30),
                  child: TextFormField(

                    validator: MultiValidator([
                      RequiredValidator(errorText: "Enter Phone Number"),
                      MinLengthValidator(10, errorText: "Enter Valid Number"),
                    ]),
                    keyboardType: TextInputType.number,
                    maxLength: 10,  
                    controller: mobileNumber,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(blueGreyColor),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(blueGreyColor), width: 1.1),
                        ),
                        prefixIcon: Icon(
                          Icons.call,
                          color: Colors.grey,
                        ),
                        prefixText: "+91| ",
                        prefixStyle:
                            TextStyle(color: Colors.black, fontSize: 16),
                        hintText: "Mobile Number"),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) => Home()));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Skip",style: TextStyle(fontWeight: FontWeight.w400),),
                      Icon(Icons.arrow_forward_ios,size: 16,color: Colors.black),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (_formKey.currentState.validate()) {
                    _callWebService();

                  }
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(seconds: 1),
                  height: 50,
                  width:  150,
                  child:  isLoading == true ? Container(height: 20,width:20,child: CircularProgressIndicator(backgroundColor: Colors.white,)):Text(
                          "LOG IN",
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
              ), //LogIn
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "or connect using",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialButton(
                      text: "Facebook",
                      color: Color(facebookColor),
                      imageUrl: "Assets/Icons/facebook (1).png",
                    ),
                    SocialButton(
                      text: "Google",
                      color: Color(googleColor),
                      imageUrl: "Assets/Icons/google.png",
                    ),
                  ],
                ),
              ), //social login
              // Container(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Container(
              //         child: Text(
              //           "Don't have an account ?",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(fontSize: 15),
              //         ),
              //       ),
              //       InkWell(
              //         onTap: () {
              //           Navigator.push(context,
              //               MaterialPageRoute(builder: (context) => SignUp()));
              //         },
              //         child: Container(
              //           margin: EdgeInsets.only(left: 5),
              //           child: Text("Sign up",
              //               textAlign: TextAlign.center,
              //               style: TextStyle(
              //                   color: Color(googleColor), fontSize: 15)),
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color color;
  final String imageUrl;

  SocialButton(
      {this.onTap,
      @required this.text,
      @required this.color,
      @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(right: 10),
                child: Image.asset(
                  imageUrl,
                  height: 25,
                )),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }



}



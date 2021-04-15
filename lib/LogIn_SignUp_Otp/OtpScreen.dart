import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_astro24/BottomNavigationBar.dart';
import 'package:online_astro24/Modal/SendOtpModal.dart';
import 'package:online_astro24/httpHelper/httpHelper.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  static const String otpScreen = "/otpScreen";

  final mobileNumber;


  OtpScreen({@required this.mobileNumber});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  HttpService _httpService = HttpService();
  bool isLoading;
  bool isLoading1;
  SendOtpModal _sendOtpModal;
  String  getOtp;
  String userOtp;

  _callWebService() async {
    setState(() {
      isLoading = true;
    });

    var sendOtpModalData = await _httpService.otpFetch(mobileNumber: widget.mobileNumber);

    if (sendOtpModalData.result == "success")
    {
      _sendOtpModal = sendOtpModalData;
      getOtp = sendOtpModalData.otp.toString();
      print(getOtp);
    }

    else
      {
        return;
      }

    setState(() {
      isLoading = false;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _callWebService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Image.asset("Assets/Images/mobile_login_pana.png"),
                alignment: Alignment.center,
                height: 250,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Phone Verification",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "One time Password",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                    ),
                    Container(
                      child: PinCodeTextField(
                        controller: otpController,
                        appContext: context,
                        length: 4,
                        onChanged: (val) {
                            userOtp = val;
                        },
                        backgroundColor: Color(0xFFFAFAFA),
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(3),
                          fieldHeight: 60,
                          fieldWidth: 50,
                          selectedFillColor: Color(pinkColor),
                          disabledColor: Color(inActiveColor),
                          inactiveFillColor: Color(inActiveColor),
                          selectedColor: Color(pinkColor),
                          activeFillColor: Color(pinkColor),
                          activeColor: Color(pinkColor),
                          inactiveColor: Color(inActiveColor),
                        ),
                        cursorColor: Color(pinkColor),
                        textStyle: TextStyle(color: Colors.white, fontSize: 24),
                        enableActiveFill: true,
                        enablePinAutofill: true,
                        boxShadows: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        keyboardType: TextInputType.number,
                        autoFocus: true,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        "Please enter the one time security code sent to your phone",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 40),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Resend Code",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(pinkColor),
                                fontSize: 21,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () async {

                          setState(() {
                            isLoading1 = true;
                          });

                           var res = await _httpService.validateOtp(phone: widget.mobileNumber,otp: userOtp);

                          if(res.status == true)
                          {
                            print("Hello");
                            SharedPreferences _pref = await SharedPreferences.getInstance();
                            await _pref.setString("userID", _sendOtpModal.user.userID);
                            await _pref.setString("name", _sendOtpModal.user.name);
                            await _pref.setString("country_code", _sendOtpModal.user.country_code);
                            await _pref.setString("phone", _sendOtpModal.user.phone);
                            await _pref.setString("email", _sendOtpModal.user.email);
                            await _pref.setString("image", _sendOtpModal.user.image);
                            await Navigator.push(context, MaterialPageRoute(builder: (ctx) => BottomNavigation()));



                          }
                          else if(res.status == false)
                            {
                              _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text("Please Enter Valid Otp"),duration: Duration(seconds: 1),));
                            }
                          setState(() {
                            isLoading1 = false;
                          });

                          //
                          // var res = await  _httpService.login(mobileNumber: widget.mobileNumber,otp: userOtp);
                          //
                          // if(res.result == "success")
                          //   {
                          //
                          //   }
                          // else
                          //   {
                          //     print("Invalid Otp");
                          //   }

                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 95),
                          child: isLoading1 == true ?  Container(height: 20,width:20,child: CircularProgressIndicator(backgroundColor: Colors.white,)):Text(
                            "SUBMIT",
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

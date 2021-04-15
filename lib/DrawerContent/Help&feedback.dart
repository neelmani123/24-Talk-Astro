import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpUs extends StatefulWidget {
  @override
  _HelpUsState createState() => _HelpUsState();
}

class _HelpUsState extends State<HelpUs> {
  final _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  String _emailError;

  var _formKey = GlobalKey<FormState>();

  launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> validate({String subject, String message}) async {
    if (_formKey.currentState.validate()) {
      await launchURL('astro20@gmail.com', '$subject', '$message');
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(pinkColor),
      appBar: AppBar(
        title: Text("Help US"),
        backgroundColor: Color(pinkColor),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  launch("tel:+919891852242");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(pinkColor),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Call us Our Team is ready to help you",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    trailing: ClipOval(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(3),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 15,
                          )),
                    ),
                  ),
                ),
              ),
              Container(margin: EdgeInsets.symmetric(horizontal: 20),child: Divider(color: Colors.white,thickness: 1,)),
              InkWell(
                onTap: () {
                  launch("mailto:feelgoodservices20@gmail.com");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(pinkColor),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Mail us Team is ready to help you",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    trailing: ClipOval(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(3),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 15,
                          )),
                    ),
                  ),
                ),
              ),
              Container(margin: EdgeInsets.symmetric(horizontal: 20),child: Divider(color: Colors.white,thickness: 1,)),
              InkWell(
                onTap: () {
                  launch("https://wa.me/+919911367450");
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(pinkColor),
                  ),
                  child: ListTile(
                    leading: Image.asset("Assets/Icons/h_whatsapp.png",height: 30,),
                    title: Text(
                      "Call us Our Team is ready to help you",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    trailing: ClipOval(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(3),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 15,
                          )),
                    ),
                  ),
                ),
              ),
              Container(margin: EdgeInsets.symmetric(horizontal: 20),child: Divider(color: Colors.white,thickness: 1,)),
              Container(
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                    color: Color(pinkColor),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                child: Text(
                                  "QUICK CONTACT",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,color: Colors.white),
                                ))),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16,color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Required"),
                                MaxLengthValidator(27,
                                    errorText: "Invalid Name"),
                                MinLengthValidator(3,
                                    errorText: "Invalid Name"),
                              ]),
                              controller: _nameController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter Full Name Here",
                                  hintStyle: TextStyle(fontSize: 13)),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16,color: Colors.white),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Required"),
                                EmailValidator(errorText: "Invalid Email"),
                              ]),
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  errorText: _emailError,
                                  border: InputBorder.none,
                                  hintText: "Enter Email Address",
                                  hintStyle: TextStyle(fontSize: 13)),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Subject",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18,color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              validator: MaxLengthValidator(30,
                                  errorText: "Invalid Subject"),
                              controller: _subjectController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Hindi",
                                  hintStyle: TextStyle(fontSize: 13)),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text(
                                "Message",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18,color: Colors.white),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Required"),
                              ]),
                              controller: _messageController,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Typing...",
                                  hintStyle: TextStyle(fontSize: 13)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: ()
                  {
                    validate(
                        subject: _subjectController.text,
                        message: _messageController.text);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 25,bottom: 25),
                    padding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 95),
                    child: Text(
                      "Send",
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
        ),
      ),
    );
  }
}



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:online_astro24/DrawerContent/TransactionHistory.dart';
import 'package:online_astro24/LogIn_SignUp_Otp/Login.dart';
import 'package:online_astro24/Notification/NotificationScreen.dart';
import 'package:online_astro24/ProfileScreen.dart';
import 'package:online_astro24/Widgets/Webview.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:online_astro24/DrawerContent/Help&feedback.dart';
import 'package:online_astro24/DrawerContent/MyWalletScreen.dart';
import 'package:online_astro24/Cart_Screen/CartScreen.dart';
import 'package:share/share.dart';
import 'package:online_astro24/DrawerContent/UserList.dart';
import 'package:online_astro24/DrawerContent/Question_history.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:online_astro24/MyReport/MyReport.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String  userID = '';
  String name = '';
  String countryCode = '';
  String _deviceType = 'WEB';
  String phone = '';
  String email = '';
  String image = '';

  Future _init() async {
    final _prefs = await SharedPreferences.getInstance();
    setState(() {
      phone = _prefs.getString('mobile') ?? '';
      email = _prefs.getString('email') ?? '';
      image = _prefs.getString('image_url') ?? '';
      name = _prefs.getString('name') ?? '';
      print("Name is:${image}");
    });
    if (Platform.isAndroid) {
      _deviceType = 'Android';
    } else if (Platform.isIOS) {
      _deviceType = 'IOS';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _init();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1465101046530-73398c7f28ca?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8YXN0cm9waG90b2dyYXBoeXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80"),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, ProfileScreen.profile);
                          },
                          child: CircleAvatar(
                            radius: 40,
                           backgroundImage: NetworkImage(image),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${name}",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          "${email}",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    drawerTiles(
                        imageUrl: "Assets/Icons/p_user.png",
                        title: "Profile",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => ProfileScreen()));
                        }),
                    drawerTiles(
                        imageUrl: "Assets/Icons/p_payment.png",
                        title: "Transaction History",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => TransactionHistory()));
                        }),
                    drawerTiles(
                        imageUrl: "Assets/Icons/p_question.png",
                        title: "My Ask Question",
                        onTap: () {
                          Navigator.pushNamed(
                              context, QuestionHistory.questionHistory);
                        }),
                    drawerTiles(
                        imageUrl: "Assets/Icons/p_report.png",
                        title: "My Report",
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>MyReport()));
                        }),
                    drawerTiles(
                        imageUrl: "Assets/Icons/Icon_material-share.png",
                        title: "Share The App",
                        onTap: () {
                          Share.share(
                              'check out my website https://example.com');
                        }),
                    drawerTiles(
                        imageUrl: "Assets/Icons/notification.png",
                        title: "Notification",
                        onTap: () {
                          Navigator.pushNamed(
                              context, NotificationScreen.notification);
                        }),
                    drawerTiles(
                        imageUrl: "Assets/Icons/my_order.png",
                        title: "My Order",
                        onTap: () {
                          //Navigator.pushNamed(context, CartScreen.cartScreen);
                        }),
                    drawerTiles(
                        imageUrl: "Assets/Icons/p_wallet.png",
                        title: "My Wallet",
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => MyWallet()));
                        }),
                    drawerTiles(
                        imageUrl: "Assets/Icons/p_condition.png",
                        title: "Terms & Conditions",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => WebViewer(
                                        appbarText: "Terms & Conditions",
                                        webUrl: "https://www.google.com/",
                                      )));
                        }),
                    drawerTiles(
                        imageUrl: "Assets/Icons/p_contact.png",
                        title: "Help and feedback ",
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => HelpUs()));
                        }),
                    drawerTiles(
                        imageUrl: "Assets/Icons/p-users.png",
                        title: "User List",
                        onTap: () {
                          Navigator.pushNamed(context, UserList.userList);
                        }),
                    drawerTiles(
                        imageUrl: "Assets/Icons/p_about_us.png",
                        title: "About US",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => WebViewer(
                                        appbarText: "About Us",
                                        webUrl: "https://www.google.com/",
                                      )));
                        }),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences _pref = await SharedPreferences.getInstance();
                  _pref.clear();
                  await Navigator.pushReplacementNamed(context, Login.login);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15, left: 15, bottom: 15),
                  child: Stack(
                    children: [
                      Container(
                        child: Image.asset(
                          "Assets/Icons/p_password_buttan.png",
                          height: 50,
                        ),
                      ),
                      Positioned(
                        left: 35,
                        bottom: 10,
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                child: Image.asset(
                                  "Assets/Icons/p_password.png",
                                  height: 30,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                      color: Color(pinkColor), fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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

Widget drawerTiles(
    {@required String imageUrl, @required String title, Function onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(left: 15, top: 9, bottom: 9),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            height: 20,
            width: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
          ),
        ],
      ),
    ),
  );
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import "package:online_astro24/Cart_Screen/CartScreen.dart";
import 'package:online_astro24/DrawerContent/CustomDrawer.dart';
import 'package:online_astro24/Home.dart';
import 'package:online_astro24/HoroscopeScreen/SignScreen.dart';
import 'package:online_astro24/ProfileScreen.dart';
import 'package:online_astro24/ShopMall.dart';
import 'package:online_astro24/utils/setup.dart';

class BottomNavigation extends StatefulWidget {

  static const String bottomNavigationScreen = "bottomNavigationScreen";

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> with SingleTickerProviderStateMixin {

  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of first screen

  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  final iconList = [
    "Assets/Icons/w_home.png",
    "Assets/Icons/category.png",
    "Assets/Icons/shopping-basket.png",
    "Assets/Icons/sign.png",
    "Assets/Icons/profile.png",
  ];

  List<String> iconListActive = [
    "Assets/Icons/home.png",
    "Assets/Icons/v_category.png",
    "Assets/Icons/color_shopping-basket.png",
    "Assets/Icons/v_sign.png",
    "Assets/Icons/v_profile.png",
  ];
  List<String> iconTextList = [
    "Home",
    "Category",
    "Order",
    "Sign",
    "Profile"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _drawerKey,
      drawer: CustomDrawer(),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        backgroundColor: Color(blueGreyColor),
        activeIndex: _bottomNavIndex,
        splashColor: Color(pinkColor),
        notchAndCornersAnimation: animation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.none,
        onTap: (index) => {setState(() => _bottomNavIndex = index), print(index),
        },
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Color(pinkColor) : Colors.white;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2,),
              isActive ? Image.asset(iconListActive[index], height: 35,) : Image.asset(iconList[index], height: 15,),
              const SizedBox(height: 4),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: AutoSizeText(
                    iconTextList[index],
                    maxLines: 2,
                    style: TextStyle(color: color),
                    group: autoSizeGroup,
                  ),
                ),
              )
            ],
          );
        },

      ),

      body: _getBody(_bottomNavIndex),
    );
  }

  Widget _getBody(int index) {

    switch (index) {
      case 0:
        return Home(drawerKey: _drawerKey);
        break;
      case 1:
        return ShoppingMall();
        break;
      case 2:
        return CartScreen();
        break;
      case 3:
        return SignScreen();
        break;
      case 4:
        return ProfileScreen();
        break;
    }
    return Container();
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:online_astro24/CategoryShopMall.dart';
import 'package:online_astro24/DrawerContent/MyWalletScreen.dart';
import 'package:online_astro24/HoroscopeScreen/SignDetailsScreen.dart';
import 'package:online_astro24/Notification/NotificationScreen.dart';
import 'package:online_astro24/Search_Screen/searchScreen.dart';
import 'package:online_astro24/Widgets/CardBox.dart';
import 'package:online_astro24/httpHelper/httpHelper.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:online_astro24/Chat_With_Astro/ChatWithAstro.dart';
import 'package:online_astro24/ShopMall.dart';
import 'package:online_astro24/Astro_Report/getAstro.dart';
import 'package:online_astro24/Talk_To_Astrologer/Talk_to_Astro.dart';
import 'package:online_astro24/Astro_Video_Call/Astro_Video_Call.dart';
import 'package:online_astro24/AskQuestion/Ask_Question_Astro.dart';
import 'package:online_astro24/Modal/HomeModal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Home extends StatefulWidget {
  static const String home = "/home";

  final GlobalKey<ScaffoldState> drawerKey;

  Home({this.drawerKey});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current = 0;
  bool isLoading;

  final List<Map<String, String>> shopping = [
    {"id": "a1", "images": "Assets/Images/gemstone.png", "text": "GEMSTONE"},
    {"id": "a2", "images": "Assets/Images/rudraksh.png", "text": "RUDRAKSH"},
    {"id": "a3", "images": "Assets/Images/red_panna.png", "text": "RED PANNA"},
  ];
  List sign = [
    {
      "images": "Assets/Sign/Group 32092.png",
      "title": "Aries",
    },
    {
      "images": "Assets/Sign/Group 32093.png",
      "title": "Gemini",
    },
    {
      "images": "Assets/Sign/Group 32094.png",
      "title": "Taurus",
    },
    {
      "images": "Assets/Sign/Group 32095.png",
      "title": "Sagittarius",
    },
    {
      "images": "Assets/Sign/Group 32096.png",
      "title": "Libra",
    },
    {
      "images": "Assets/Sign/Group 32097.png",
      "title": "Leo",
    },
    {
      "images": "Assets/Sign/Group 32098.png",
      "title": "Pisces",
    },
    {
      "images": "Assets/Sign/Group 32099.png",
      "title": "Virgo",
    },
    {
      "images": "Assets/Sign/Group 32100.png",
      "title": "Cancer",
    },
    {
      "images": "Assets/Sign/Group 32101.png",
      "title": "Capricorn",
    },
    {
      "images": "Assets/Sign/Group 32102.png",
      "title": "Aquarius",
    },
    {
      "images": "Assets/Sign/Group 32103.png",
      "title": "Scorpio",
    },
  ];

  List banner = [
    {"images": "Assets/banner/banner (2).png"},
    {"images": "Assets/banner/Group 32088.png"},
    {"images": "Assets/banner/Group 32089.png"},
    {"images": "Assets/banner/Group 32090.png"},
  ];

  HttpService _httpService = HttpService();

  HomeModal homeData;

  callWebService()
  async {
    setState(() {
      isLoading = true;
    });

    var res = await _httpService.home();
    if(res.result == "success")
      {
        homeData = res;
      }
    setState(() {
      isLoading = false;
    });
  }

  List details=[];
//Api is use of Shoppinng Mall List
  Future getShopdetails()async
  {
     var response=await http.get("https://talkastro.devclub.co.in/userapi/get_shop_category");
     Map data=json.decode(response.body);
     var respon=data['result'];
     details=data['category'] as List;
     print(details);
     setState(() {
       details.add(data);
     });

  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callWebService();
    getShopdetails();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "Assets/Images/background.png"
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                leading: InkWell(
                  onTap: ()
                  {
                    widget.drawerKey.currentState.openDrawer();
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 10, right: 13),
                      child: Image.asset(
                        "Assets/Icons/menu.png",
                        height: 18,
                      )),
                ),
                title: Container(
                  child: Text(
                    "ASTROLOGY24",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                expandedHeight: 120,
                flexibleSpace: FlexibleSpaceBar(
                  background: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => SearchScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(
                          left: 12.0,
                          right: 12.0,
                          top: 95,
                          bottom: 10
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Explore",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  centerTitle: true,

                ),
                actions: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (ctx) => MyWallet()));
                    },
                    child: Container(
                      child: Row(children: [
                        Image.asset(
                          "Assets/Images/bullet.png",
                          height: 22,
                        ),
                        isLoading == true ? Container():Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Text(
                            "\u{20B9}${homeData.user.wallet??''}",
                            //"30",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => NotificationScreen()));
                    },
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SliverList(delegate: SliverChildListDelegate(
                  [
                    Stack(
                      children: [
                        Container(
                          color: Color(pinkColor),
                          height: 50,
                        ),
                        Container(
                          height: 160,
                          width: double.infinity,
                          child: CarouselSlider.builder(
                            options: CarouselOptions(
                                autoPlay: true,
                                reverse: false,
                                enableInfiniteScroll: true,
                                viewportFraction: 1.0,
                                initialPage: 0,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                Duration(milliseconds: 1000),
                                pauseAutoPlayOnTouch: true,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index, abc) {
                                  _current = index;
                                }),
                            itemCount: banner.length,
                            itemBuilder: (ctx,index,i)
                            {
                              return Container(
                                margin: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                        image: AssetImage(banner[index]["images"]))),
                              );
                            },
                          ),
                        ),  
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "Assets/Icons/3652191.png",
                                    height: 35,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Daily Horoscope",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 60),
                                height: 3,
                                width: 62,
                                color: Color(pinkColor),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                    Container(
                      height: 130,
                      child: ListView.builder(
                        itemCount: sign.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) => Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (ctx) => SignDetailsScreen(imageUrl: sign[i]["images"],title:sign[i]["title"])));
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Image.asset(
                                    sign[i]["images"],
                                    height: 100,
                                  ),
                                  Text(
                                    sign[i]["title"],
                                    style: TextStyle(
                                        color: Color(pinkColor),
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Image.asset(
                        "Assets/Images/banner.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            child: Image.asset(
                              "Assets/Icons/1889241.png",
                              height: 30,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Connect With Astrologer",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                height: 3,
                                width: 62,
                                color: Color(pinkColor),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            CardBox(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => ChatNowScreen()));
                                },
                                imageUrl: "Assets/Images/chat.png",
                                text: "Chat With Astrologer",
                                subText: "(First minute is not charged)"),
                            CardBox(
                                onTap: ()
                                {
                                  Navigator.pushNamed(context,TalkToAstro.talkToAstro);
                                },
                                imageUrl: "Assets/Images/talk.png",
                                text: "Talk to Astrologer",
                                subText: "(First minute is not charged)"),
                          ],
                        ),
                        Row(
                          children: [
                            CardBox(
                                onTap: () {
                                  Navigator.pushNamed(context, AstroVideoCall.astroVideoCall);
                                },
                                imageUrl: "Assets/Images/video_call.png",
                                text: "Video Call",
                                subText: "(First minute is not charged)"),
                            CardBox(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => ShoppingMall()));
                                },
                                imageUrl: "Assets/Images/astro_mart.png",
                                text: "Astro Mart",
                                subText: "Online Shopping"),
                          ],
                        ),
                        Row(
                          children: [
                            CardBox(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, GetAstro.getAstro);
                                },
                                imageUrl: "Assets/Images/astrolger.png",
                                text: "Astrologer Report",
                                subText: "(Manually prepared by astrology)"),
                            CardBox(
                                onTap: ()
                                {
                                  Navigator.pushNamed(context, AskQuestionAstro.askQuestionastro);
                                },
                                imageUrl: "Assets/Images/ask_icon.png",
                                text: "Ask A Question",
                                subText: ""),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Row(
                        children: [
                          Expanded(
                              child: Image.asset("Assets/Images/Group 32072.png")),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Image.asset("Assets/Images/Group 32073.png"))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  "Assets/Images/cart.png",
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Talk Astro Shopping Mall",
                                      style: TextStyle(
                                          color: Color(pinkColor),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2),
                                      height: 3,
                                      width: 80,
                                      color: Color(pinkColor),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => ShoppingMall()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Text(
                                "View all",
                                style: TextStyle(
                                    color: Color(pinkColor),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 190,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Container(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (ctx, i) => Container(
                            margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                            padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                            child: Column(
                              children: [
                                Image.asset(
                                  shopping[i]["images"],
                                  height: 100,
                                ),
                                InkWell(
                                  onTap: () {
                                    print(details[i]['categoryID']);
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (ctx) =>
                                            CategoryMall(
                                              id: details[i]['categoryID'],text: details[i]['categoryname'],))
                                    );
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(top: 15),
                                      child: Text(
                                        details[i]['categoryname'],
                                        style: TextStyle(
                                            color: Color(pinkColor),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
              ))
            ],
          ))
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_astro24/Chat_With_Astro/chatScreen.dart';
import 'package:online_astro24/Modal/GetAstroDetails.dart';
import 'package:online_astro24/utils/setup.dart';

import 'httpHelper/httpHelper.dart';

class AstroDetailsScreen extends StatefulWidget {
  String category;
  AstroDetailsScreen({this.category});
  @override
  _AstroDetailsScreenState createState() => _AstroDetailsScreenState();
}

class _AstroDetailsScreenState extends State<AstroDetailsScreen> {
  final List<Map<String, String>> gallery = [
    {"images": "Assets/Images/a_image.png"},
    {
      "images": "Assets/Images/a_image_2.png",
    },
    {"images": "Assets/Images/a_image_3.png"},
    {
      "images": "Assets/Images/a_image_4.png",
    }
  ];
  bool isLoading;
  HttpService _httpService = HttpService();
  GetAstroDetails _getAstroDetails;
  String name="";
  String image="";
  String skill="";
  String language="";
  String categor="";
  String exp="";
  String city="";
  String state="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAstroDetails();
  }

  getAstroDetails() async
  {
    setState(() {
      isLoading = true;
    });
    var res = await _httpService.getAstroDetails(category:widget.category);
    if(res.result=="success")
      {
        _getAstroDetails=res;
        print(res.details.realName);
        setState(() {
          isLoading=false;
          name=res.details.realName;
          skill=res.details.skill;
          language=res.details.language;
          categor=res.details.category;
          exp=res.details.exp;
          city=res.details.city;
          state=res.details.state;
          image=res.details.profile;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(pinkColor),
        title: Text("Astrologer detail"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "Assets/Images/background.png",
                ),
                fit: BoxFit.fitWidth)),
        child: Column(
          children: [
            Expanded(
              child: isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.white,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Container(
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(image),
                                      radius: 50,
                                    )),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    name??'',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 21),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    skill??'',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(color: Colors.grey, fontSize: 15),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "Assets/Images/language.png",
                                        height: 25,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        language??'',
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        height: 30,
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10, right: 10),
                                        child: Text(
                                          "2472 total",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Container(
                                        child: Image.asset(
                                          "Assets/Images/stars.png",
                                          height: 20,
                                          width: 50,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Gallery",
                            style:
                                TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                            height: 90,
                            child: ListView.builder(
                                itemCount: gallery.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) => Container(
                                      margin: EdgeInsets.only(right: 3),
                                      child: Image.asset(
                                        gallery[i]["images"],
                                        height: 20,
                                      ),
                                    ))),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          child: Text(
                            "About",
                            style:
                                TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            categor??'',style: TextStyle(color: Colors.grey),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("Assets/Images/experience.png",height: 30,),
                                  SizedBox(width: 10,),
                                  Expanded(child:Text("${exp} Years experience",style: TextStyle(fontSize: 16),),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("Assets/Images/a_location.png",height: 25,),
                                  SizedBox(width: 10,),
                                  Expanded(child: Text("${city}, ${state}",style: TextStyle(fontSize: 16),))
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rating & Review", style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                            Text("View all")
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Container(
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(image),
                                    radius: 25,
                                  )),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(child: Text(name??'')),
                                    Row(
                                      children: [
                                        Container(
                                          child: Image.asset("Assets/Images/stars.png",height: 10,),
                                        ),
                                        Container(margin: EdgeInsets.only(left: 10),child: Text("5.0")),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(margin: EdgeInsets.only(top: 10),child: Text("My journey with this app begins with a booking of free consultation. To my surprise no person was available to complete my booking.",style: TextStyle(color: Colors.grey),))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color:Color(blueGreyColor),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => ChatScreen()));
                      },
                      child: Row(
                        children: [
                          Container(margin: EdgeInsets.only(right: 10),child: Image.asset("Assets/Images/chat.png",height: 30,)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("CHAT NOW",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                              Text("40/- Only per Mint.",style: TextStyle(color: Colors.white,fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 2,
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        Container(margin: EdgeInsets.only(right: 10),child: Image.asset("Assets/Images/talk.png",height: 30,)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CALL NOW",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                            Text("40/- Only per Mint.",style: TextStyle(color: Colors.white,fontSize: 10),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

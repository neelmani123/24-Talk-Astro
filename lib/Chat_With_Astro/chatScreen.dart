import 'package:flutter/material.dart';
import 'package:online_astro24/utils/setup.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              color: Color(pinkColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              size: 25,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(32)),
                          child: CircleAvatar(
                            radius: 30,
                            child: Image.asset("Assets/Images/user_pic.png"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Astro Anamika",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),


                  // PopupMenuButton(
                  //     onSelected: (selectedVal) {},
                  //     icon: Icon(Icons.more_vert,color: Colors.white,),
                  //     itemBuilder: (_) => [
                  //           PopupMenuItem(
                  //             child: Text("Report "),
                  //           ),
                  //           PopupMenuItem(
                  //             child: Text("Mute Messages"),
                  //           ),
                  //           PopupMenuItem(
                  //             child: Text("Mute Video Chats "),
                  //           ),
                  //           PopupMenuItem(
                  //             child: Text("Unfollow"),
                  //           ),
                  //           PopupMenuItem(
                  //             child: Text("Block"),
                  //           ),
                  //         ]),
                ],
              ),
            ),
            Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 220,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(pinkColor)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hey, nice to meet you Alex",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ), // sender
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            width: 220,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(pinkColor)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hey Jenna!! I see were both at Burning Man! huge fans ",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 15, right: 15, bottom: 20, top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.teal,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                "Mar. 7, 10:17 PM",
                                style: TextStyle(color: Colors.teal),
                              )),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 10,
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 220,
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(pinkColor)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "OMG me too! Totally wish the City would have more stuff like that",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 10,
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 220,
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(pinkColor)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "OMG me too! Totally wish the City would have more stuff like that",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // receiver
                  ],
                )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black)),
                      child: Row(
                        children: [
                         Container(
                           margin: EdgeInsets.only(left: 10,right: 10),
                           child: Image.asset("Assets/Icons/emoticon.png",height: 22,),
                         ),
                          Expanded(child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type here..."
                            ),
                          )),
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(Icons.camera_alt),
                            ),
                          ),
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(Icons.attach_file_rounded),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Container(margin: EdgeInsets.only(left: 10),child: Image.asset("Assets/Icons/send.png",height: 40,),)

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

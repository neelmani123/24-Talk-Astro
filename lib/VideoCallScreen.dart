import 'package:flutter/material.dart';


class VideoCallScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("Assets/banner/image_on_call.png",fit: BoxFit.fitWidth,),
              ),

            ],
          ),

        ],
      ),
    );
  }
}

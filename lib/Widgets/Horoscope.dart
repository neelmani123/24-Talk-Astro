import 'package:flutter/material.dart';
import 'package:online_astro24/utils/setup.dart';

class Horoscope extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function onTap;

  Horoscope(
      {@required this.imageUrl, @required this.title,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Image.asset(
              imageUrl,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Color(0xFF3D3D3D),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
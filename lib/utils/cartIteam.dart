import 'package:flutter/material.dart';
import 'package:online_astro24/Cart_Screen/CartScreen.dart';
import 'package:online_astro24/utils/setup.dart';

class CartData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Container(
        margin:
        EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "Assets/Images/red_panna.png",
                height: 70,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '\u{20B9} 2300.00 /-',
                      style: TextStyle(
                          fontWeight: FontWeight.w700),
                    ),
                    margin: EdgeInsets.only(bottom: 8),
                  ),
                  Container(
                    child: Text("Emerals (panna)"),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Color(pinkColor),
                              borderRadius:
                              BorderRadius.circular(20)),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10),
                          child: Text(
                            "1",
                            style: TextStyle(
                                color: Color(pinkColor),
                                fontSize: 18),
                          )),
                      Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Color(pinkColor),
                              borderRadius:
                              BorderRadius.circular(20)),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  /*InkWell(
                    onTap: () {
                      cartBottomSheet(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.grey,
                          ),
                          Text(
                            "Remove",
                            style:
                            TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  )*/
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

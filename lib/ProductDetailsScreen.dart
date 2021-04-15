import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_astro24/AddAddress/AddAddressScreen.dart';
import 'package:online_astro24/PaymentScreen/finalPaymentScreen.dart';
import 'package:online_astro24/providers/products.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:provider/provider.dart';


class ProductDetails extends StatefulWidget {

  static const String productDetailScreen = "/productDetailScreen";

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {



  int _current = 0;
  List imgList = [
    "Assets/Images/red_panna.png",
    "Assets/Images/gemstone.png",
    "Assets/Images/rudraksh.png",
    "Assets/Images/moti.png",
  ];
  List <T> map<T>(List list , Function handler)
  {
    List<T> result = [];
    for(var i = 0 ; i < list.length; i++)
      {
        result.add(handler(i, list[i]));
      }
    return result;
  }
  @override
  Widget build(BuildContext context) {

    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProducts = Provider.of<Products>(context).findById(productId);

    return Scaffold(
      backgroundColor: Color(blueGreyColor),
      appBar: AppBar(
        title: Text(loadedProducts.title),
        backgroundColor: Color(pinkColor),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 800,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("Assets/Images/background.png"),
                            fit: BoxFit.fitHeight),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 250,
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                      height: 200,
                                      initialPage: 0,
                                      reverse: false,
                                      viewportFraction: 1.0,
                                      enableInfiniteScroll: false,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (index, pageChange) {
                                        setState(() {
                                          _current = index;
                                        });
                                      }),
                                  items: imgList
                                      .map((images) => Builder(
                                      builder: (context) => Container(
                                          child: Image.asset(images))))
                                      .toList(),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: map<Widget>(
                                      imgList,(index,url)
                                  {
                                    return Container(
                                      width: 10.0,
                                      height: 10.0,
                                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                                      decoration: BoxDecoration(shape: BoxShape.circle,
                                          color: _current == index ?Color(pinkColor) : Colors.grey),
                                    );
                                  }
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Emerals (panna)",
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          '\u{20B9}4000.00/-',
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    "Product Details",
                                    style: TextStyle(
                                        color: Color(pinkColor),
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                      "Emerald or Panna Rashi Ratan is regarded as a highly effective astrological gemstone of Vedic astrology. The most effective time for Emerald?s power is the spring season. According tothe classical Hindu literature, emerald gemstone representssmall yet powerful planet Mercury (Budh) that bears a stronginfluence over native?s life. They deeply believed that wearingPanna stone benefits the individual by providing good health,wisdom, prosperity, creative skills, and blissful marital life."),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    "Benefits",
                                    style: TextStyle(
                                        color: Color(pinkColor),
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                      "Emerald or Panna Rashi Ratan is regarded as a highly effective astrological gemstone of Vedic astrology. The most effective time for Emerald?s power is the spring season. According tothe classical Hindu literature"),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    "Try Other Products",
                                    style: TextStyle(
                                        color: Color(pinkColor),
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 680),
                        height: 220,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (ctx, i) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                width: 180,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.0, 0.0), //(x,y)
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(),
                                    Container(
                                      child: Image.asset(
                                        "Assets/Images/red_panna.png",
                                        height: 80,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              "Mccain Smile (750 g)",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              '\u{20B9}30',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(pinkColor),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ))))
                  ],
                ),
                Container(
                  height: 50,
                ),
              ],
            ),
          ),
          Container(
            color: Color(pinkColor),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => AddAddress() ));
                      },
                      child: Text(
                        "product 1",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Text(
                        '\u{20B9}4000.00/-',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: ()
                  {
                    Navigator.pushReplacementNamed(context, FinalPaymentScreen.finalPaymentScreen);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Row(
                      children: [
                        Text(
                          "CHECKOUT",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

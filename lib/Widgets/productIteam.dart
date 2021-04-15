import 'package:flutter/material.dart';
import 'package:online_astro24/ProductDetailsScreen.dart';
import 'package:online_astro24/utils/setup.dart';



class ProductItem extends StatefulWidget {

  final String id;
  final String title;
  final String imageUrl;
  final double price;

  ProductItem({@required this.id, @required this.title, @required this.imageUrl,@required this.price});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Container(margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),child: Icon(Icons.favorite)),
          //   ],
          // ),
            InkWell(
              onTap: ()
              {
                Navigator.pushNamed(context, ProductDetails.productDetailScreen,arguments: widget.id);
              },
              child: Column(
                children: [

                  Container(
                    margin: const EdgeInsets.only(bottom: 10,top: 30),
                    child: Image.asset(
                      widget.imageUrl,
                      height: 100,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5,),
                    child: Text(widget.title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10,),
                    child: Text(
                      '\u{20B9}${widget.price.toString()}/-',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),


            InkWell(
              onTap: ()
              {

              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(pinkColor),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                padding: const EdgeInsets.symmetric(
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
            ),
          ],
        ),
      ),
    );
  }
}

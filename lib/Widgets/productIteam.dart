import 'package:flutter/material.dart';
import 'package:online_astro24/ProductDetailsScreen.dart';
import 'package:online_astro24/httpHelper/httpHelper.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';



class ProductItem extends StatefulWidget {

  final String id;
  final String title;
  final String imageUrl;
  final String price;
  ProductItem({@required this.id, @required this.title, @required this.imageUrl,@required this.price});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  bool isLoading=true;
  String userId1="";
  HttpService _httpService = HttpService();

  _addToCard() async{
    setState(() {
      isLoading = true;
    });
    final _prefs = await SharedPreferences.getInstance();
    userId1 = _prefs.getString('userID') ?? '';
    var res = await _httpService.addToCard(user_id:userId1,productID: widget.id);
    if(res.result == "success")
    {
      print("ProductId Is:${widget.id}");
      setState(() {
        _prefs.setString('qty1', res.qty);
        Fluttertoast.showToast(msg: res.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,);

        /*_scaffoldKey.currentState.showSnackBar(
            new SnackBar(
                content: new Text(res.message)));*/
      });

     /* Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserList()),
      );*/
    }
    else
    {
      print("SigUp fAILED");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
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
                  Navigator.push(context, MaterialPageRoute(
                      builder: (ctx) =>
                          ProductDetails(
                            id: widget.id,text: widget.title,))
                  );
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
                  _addToCard();

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
      ),
    );
  }
}

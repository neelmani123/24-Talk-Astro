import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:online_astro24/AddAddress/NewAddress.dart';
import 'package:online_astro24/AddAddress/PlaceOrder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  List<Widget> addressHolder = [];
  String userId1 = '';
  List details = [];

  // Initial LOCATION
  PickResult selectedPlace;
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);
  bool _isLoading = true;
  String _selectedIndex = "";
  int _value2 = 1;
  //get Addedd List APi
  Future getAddress() async {
    final _prefs = await SharedPreferences.getInstance();
    userId1 = _prefs.getString('userID') ?? '';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final res = jsonEncode({
      "user_id": userId1,
    });
    var response = await http.post(
        "https://talkastro.devclub.co.in/userapi/address_list",
        headers: headers,
        body: res);
    Map data = json.decode(response.body);
    var status = data['status'];
    if (status == true) {
      setState(() {
        _isLoading = false;
      });
      details = data['address'] as List;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Assets/Images/background.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color(pinkColor),
          title: Text('Select Address'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => NewAddress()));
                }),
          ],
        ),
        /*body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PlacePicker(
                        apiKey: apiKey,
                        initialPosition: kInitialPosition,
                        useCurrentLocation: true,
                        selectInitialPosition: true,

                        //usePlaceDetailSearch: true,
                        onPlacePicked: (result) {
                          selectedPlace = result;
                          Navigator.of(context).pop();
                          setState(() {});
                          print(selectedPlace.formattedAddress);

                        },

                      );
                    },
                  ),
                );

              },
              child: Container(
                width: 190,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFCE4EC),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Color(pinkColor),
                    ),
                    Text(
                      "Add New Address",
                      style: TextStyle(
                          color: Color(pinkColor),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Expanded(
              child: ListView(
                children: [],
              ),
            )
          ],
        ),*/
        body: _isLoading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: details.length,
                          itemBuilder: (BuildContext context, int i) {
                            return Container(
                              child: Card(
                                  child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Color(pinkColor),
                                    )),
                                margin: EdgeInsets.only(top: 20),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(details[i]['home']),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(details[i]['mobile']),
                                          Text(details[i]['address']),
                                          Text(details[i]['locality']),
                                          Text(details[i]['pincode']),
                                        ],
                                      ),
                                      Spacer(),
                                      Radio(
                                          value: i,
                                          groupValue: _value2,
                                          onChanged: (int value) {
                                            setState(() {
                                              _value2 = value;
                                              _selectedIndex=details[i]['id'];
                                              print(
                                                  "Radio index is ${_selectedIndex}");
                                            });
                                          })
                                    ],
                                  ),
                                ),
                              )),
                            );
                          }),
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          // _isLoading = true;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    PlaceOrder(address_id:_selectedIndex)));
                        //  addAddress();
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            top: 20, bottom: 10, left: 20, right: 20),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        child: _isLoading == true
                            ? Container(
                                height: 30,
                                width: 20,
                                child: CircularProgressIndicator())
                            : Text(
                                "Continue",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                        decoration: BoxDecoration(
                          color: Color(blueGreyColor),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 2.0,
                            ),
                          ],
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

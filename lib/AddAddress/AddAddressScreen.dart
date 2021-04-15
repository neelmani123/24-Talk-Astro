import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:online_astro24/utils/setup.dart';

class AddAddress extends StatefulWidget {

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

  List<Widget> addressHolder = [];

  // Initial LOCATION
  PickResult selectedPlace;
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(pinkColor),
        title: Text('Addresses'),
      ),
      body: Column(
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
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(125.0),
          child: AppBar( // hides leading widget
            flexibleSpace: Column(
              children: [
                Container(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 92),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search, color: Colors.grey,),
                                hintText: "Explore",
                                border: InputBorder.none,
                              ),
                              autofocus: true,
                              onTap: () {
                                // showSearch(context: context, delegate: DataSearch());
                              },
                            ))
                          ],
                        )),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

// class DataSearch extends SearchDelegate<String>
// {
//
//   final cities = [
//   'Agra',
//   'Allahabad',
//   'Aligarh',
//   'Ambedkar Nagar',
//   'Auraiya',
//   'Azamgarh',
//   'Barabanki',
//   'Budaun',
//   'Bagpat',
//   'Bahraich',
//   'Bijnor',
//   'Ballia',
//   'Banda',
//   'Balrampur',
//   'Bareilly',
//   'Basti',
//   'Bulandshahr',
//   'Chandauli',
//   'Chhatrapati Shahuji Maharaj Nagar',
//   'Chitrakoot',
//   'Deoria',
//   'Etah',
//   'Kanshi Ram Nagar',
//   'Etawah',
//   'Firozabad',
//   'Farrukhabad',
//   'Fatehpur',
//   'Faizabad',
//   'Gautam Buddh Nagar',
//   'Gonda',
//   'Ghazipur',
//   'Gorakhpur',
//   'Ghaziabad',
//   'Hamirpur',
//   'Hardoi',
//   'Mahamaya Nagar',
//   'Jhansi',
//   'Jalaun',
//   'Jyotiba Phule Nagar',
//   'Jaunpur district',
//   'Ramabai Nagar (Kanpur Dehat)',
//   'Kannauj',
//   'Kanpur',
//   'Kaushambi',
//   'Kushinagar',
//   'Lalitpur',
//   'Lakhimpur Kheri',
//   'Lucknow',
//   'Mau',
//   'Meerut',
//   'Maharajganj',
//   'Mahoba',
//   'Mirzapur',
//   'Moradabad',
//   'Mainpuri',
//   'Mathura',
//   'Muzaffarnagar',
//   'Panchsheel Nagar district (Hapur)',
//   'Pilibhit',
//   'Shamli',
//   'Pratapgarh',
//   'Rampur',
//   'Raebareli',
//   'Saharanpur',
//   'Sitapur',
//   'Shahjahanpur',
//   'Sant Kabir Nagar',
//   'Siddharthnagar',
//   'Sonbhadra',
//   'Sant Ravidas Nagar',
//   'Sultanpur',
//   'Shravasti',
//   'Unnao',
//   'Varanasi',
//   ];
//
//   final recentCity = [
//     'Sitapur',
//     'Shahjahanpur',
//     'Sant Kabir Nagar',
//     'Siddharthnagar',
//     'Sonbhadra'
//   ];
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     //actions for appbar
//     return [
//       IconButton(icon: Icon(Icons.clear), onPressed: (){
//         query ="";
//       })
//     ];
//
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     // leading icon left of appbar
//     return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation,), onPressed: (){
//       close(context, null);
//     });
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // show result basedon selection
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestionList = query.isEmpty?recentCity:cities.where((p) =>  p.startsWith(query)).toList();
//     return ListView.builder(itemCount: suggestionList.length,itemBuilder: (ctx,i) => ListTile(
//       leading: Icon((Icons.location_city)),
//       title: Text(suggestionList[i]),
//     ));
//
//   }
//
// }
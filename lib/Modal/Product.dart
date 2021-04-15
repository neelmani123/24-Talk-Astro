import 'package:flutter/material.dart';

class Product with ChangeNotifier
{
    final String id;
    final String title;
    final String description;
    final double price;
    final imageUrl;
    bool isFavourite;

    Product({@required this.id, @required this.title, @required this.description, @required this.imageUrl,@required this.price,this.isFavourite});


}
import 'package:flutter/material.dart';
import 'package:online_astro24/Modal/Product.dart';


class Products with ChangeNotifier
{
  List<Product> _items =
  [
    Product(id: "a1", title: "Red Panna", description: "", imageUrl: "Assets/Images/red_panna.png", price: 4000.00),
    Product(id: "a2", title: "Gemstone", description: "", imageUrl: "Assets/Images/rudraksh.png", price: 2300.00),
    Product(id: "a3", title: "Gemstone", description: "", imageUrl: "Assets/Images/rudraksh.png", price: 2300.00),
    Product(id: "a4", title: "Gemstone", description: "", imageUrl: "Assets/Images/red_panna.png", price: 1500.00,),

  ];

  List<Product>items()
  {
    return[..._items];
  }

  Product findById(String id)
  {
    return _items.firstWhere((element) => element.id == id);
  }




}
import 'package:flutter/material.dart';
class MinusAddToCard
{
  String message;
  String result;
  String qty;
  User user;
  MinusAddToCard({this.message,this.result,this.qty,this.user});
  factory MinusAddToCard.fromJson(Map<String, dynamic> json) {
    return MinusAddToCard(
      message: json['message'],
      result: json['result'],
      qty: json['qty'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['result'] = this.result;
    data['qty']=this.qty;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String result;
  String message;
  String qty;

  User({this.result,this.message,this.qty});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      result: json['result'],
      message: json['message'],
      qty: json['qty'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result']=this.result;
    data['message'] = this.message;
    data['qty'] = this.qty;
    return data;
  }
}
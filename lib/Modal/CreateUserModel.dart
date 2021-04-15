import 'package:flutter/material.dart';
class CreateUserModel
{
  String message;
  String result;
  User user;
  CreateUserModel({this.message,this.result,this.user});
  factory CreateUserModel.fromJson(Map<String, dynamic> json) {
    return CreateUserModel(
      message: json['message'],
      result: json['result'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['result'] = this.result;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }

}
class User {
  String user_id;
  String name;
  String gender;
  String date_of_birth;
  String time_of_birth;
  String place_of_birth;
  String relationship;

  User({this.user_id,this.name,this.gender, this.date_of_birth, this.time_of_birth,this.place_of_birth,this.relationship});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      user_id: json['user_id'],
      name: json['name'],
      gender: json['gender'],
      date_of_birth: json['dob'],
      time_of_birth: json['birth_time'],
      place_of_birth: json['birth_place'],
      relationship: json['relationship'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id']=this.user_id;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['dob'] = this.date_of_birth;
    data['birth_time'] = this.time_of_birth;
    data['birth_place'] = this.place_of_birth;
    data['relationship'] = this.relationship;

    return data;
  }
}
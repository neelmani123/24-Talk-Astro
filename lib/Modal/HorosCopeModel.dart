class HorosCopeModel
{

  User user;
  HorosCopeModel({this.user});
  factory HorosCopeModel.fromJson(Map<String, dynamic> json) {
    return HorosCopeModel(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}
class User {
  String current_date;
  String description;
  String compatibility;
  String mood;
  String color;
  String lucky_number;
  String lucky_time;

  User({this.current_date,this.description,this.compatibility, this.mood, this.color,this.lucky_number,this.lucky_time});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      current_date: json['current_date'],
      description: json['description'],
      compatibility: json['compatibility'],
      mood: json['mood'],
      color: json['color'],
      lucky_number: json['lucky_number'],
      lucky_time: json['lucky_time'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_date']=this.current_date;
    data['description'] = this.description;
    data['compatibility'] = this.compatibility;
    data['mood'] = this.mood;
    data['color'] = this.color;
    data['lucky_number'] = this.lucky_number;
    data['lucky_time'] = this.lucky_time;

    return data;
  }
}
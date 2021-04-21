class UserListData
{
  String user_id;
  String name;
  String gender;
  String date_of_birth;
  String time_of_birth;
  String place_of_birth;
  String relationship;
  String result;
  String message;
  List user_profile;
  UserListData({this.result,this.message,this.user_profile,this.name,this.gender,this.date_of_birth,this.place_of_birth,this.time_of_birth,this.relationship});
  factory UserListData.fromJson(Map<String, dynamic> json) {
    return UserListData(
      message: json['message'],
      result: json['result'],
      user_profile: List<UserListData>.from(json["User"].map((x) => User.fromJson(x))),
    );
  }
  Map<String, dynamic> toJson() =>{
   "result":result,
    "message":message,
    "user_profile":List<dynamic>.from(user_profile.map((e) => e.toJson())),
  };
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
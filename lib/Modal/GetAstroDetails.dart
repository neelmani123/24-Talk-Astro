class GetAstroDetails
{
  String result;
  String message;
  AstroDetails details;

  GetAstroDetails({this.result,this.message,this.details});
  factory GetAstroDetails.fromJson(Map<String, dynamic> json) {
    return GetAstroDetails(
      result: json['result'],
      message: json['message'],
      details: json['astrologer_detail'] != null ? AstroDetails.fromJson(json['astrologer_detail']) : null,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['result'] = this.result;
    if (this.details != null) {
      data['astrologer_detail'] = this.details.toJson();
    }
    return data;
  }

}
class AstroDetails
{
  String realName;
  String name;
  String contactNumber;
  String contactNumber2;
  String email;
  String dob;
  String gender;
  String exp;
  String profile;
  String category;
  String skill;
  String language;
  String city;
  String state;
  String country;
  String pincode;
    AstroDetails({this.realName,this.name,this.contactNumber,this.contactNumber2,this.email,
    this.dob,this.gender,this.exp,this.profile,this.category,this.skill,this.language,this.city,this.state,this.country,this.pincode});

    factory AstroDetails.fromJson(Map<String, dynamic> json){
      return AstroDetails(
        realName: json['real_name'],
        name: json['name'],
        contactNumber: json['contact_no'],
        contactNumber2: json['contact_no2'],
        email: json['email'],
        dob: json['dob'],
        gender: json['gender'],
        exp: json['experience'],
        profile: json['profile'],
        category: json['category'],
        skill: json['skill'],
        language: json['language'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
        pincode: json['pincode'],
      );
    }

    Map<String,dynamic> toJson(){
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['real_name']=this.realName;
      data['name']=this.name;
      data['contact_no']=this.contactNumber;
      data['contact_no2']=this.contactNumber2;
      data['email']=this.email;
      data['dob']=this.dob;
      data['gender']=this.gender;
      data['experience']=this.exp;
      data['profile']=this.profile;
      data['category']=this.category;
      data['skill']=this.skill;
      data['language']=this.language;
      data['city']=this.city;
      data['state']=this.state;
      data['country']=this.country;
      data['pincode']=this.pincode;
      return data;
    }

}
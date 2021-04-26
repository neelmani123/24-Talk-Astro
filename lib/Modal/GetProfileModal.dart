class GetProfileModal {
    String message;
    String referal_code;
    String result;
    User user;

    GetProfileModal({this.message, this.referal_code, this.result, this.user});

    factory GetProfileModal.fromJson(Map<String, dynamic> json) {
        return GetProfileModal(
            message: json['message'],
            referal_code: json['referal_code'],
            result: json['result'],
            user: json['user'] != null ? User.fromJson(json['user']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['referal_code'] = this.referal_code;
        data['result'] = this.result;
        if (this.user != null) {
            data['user'] = this.user.toJson();
        }
        return data;
    }
}

class User {
    String added_on;
    String address;
    String birth_place;
    String birth_time;
    String contact_no;
    String dob;
    String email;
    String gender;
    String name;
    String relationship;
    String updated_on;
    String userPID;
    String user_id;
    String image;

    User({this.added_on, this.address, this.birth_place, this.birth_time, this.contact_no, this.dob, this.email, this.gender, this.name, this.relationship, this.updated_on, this.userPID, this.user_id,this.image});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            added_on: json['added_on'],
            address: json['address'],
            birth_place: json['birth_place'],
            birth_time: json['birth_time'],
            contact_no: json['contact_no'],
            dob: json['dob'],
            email: json['email'],
            gender: json['gender'],
            name: json['name'],
            relationship: json['relationship'],
            updated_on: json['updated_on'],
            userPID: json['userPID'],
            user_id: json['user_id'],
            image: json['user_image'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['added_on'] = this.added_on;
        data['address'] = this.address;
        data['birth_place'] = this.birth_place;
        data['birth_time'] = this.birth_time;
        data['contact_no'] = this.contact_no;
        data['dob'] = this.dob;
        data['email'] = this.email;
        data['gender'] = this.gender;
        data['name'] = this.name;
        data['relationship'] = this.relationship;
        data['updated_on'] = this.updated_on;
        data['userPID'] = this.userPID;
        data['user_id'] = this.user_id;
        data['user_image']=this.image;
        return data;
    }
}
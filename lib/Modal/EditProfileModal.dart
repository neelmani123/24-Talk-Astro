class UpdateProfileModal {
    String message;
    String result;
    User user;

    UpdateProfileModal({this.message, this.result, this.user});

    factory UpdateProfileModal.fromJson(Map<String, dynamic> json) {
        return UpdateProfileModal(
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
    String birth_time;
    String dob;
    String email;
    String gender;
    String name;
    String updated_on;

    User({this.birth_time, this.dob, this.email, this.gender, this.name, this.updated_on});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            birth_time: json['birth_time'],
            dob: json['dob'],
            email: json['email'],
            gender: json['gender'],
            name: json['name'],
            updated_on: json['updated_on'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['birth_time'] = this.birth_time;
        data['dob'] = this.dob;
        data['email'] = this.email;
        data['gender'] = this.gender;
        data['name'] = this.name;
        data['updated_on'] = this.updated_on;
        return data;
    }
}
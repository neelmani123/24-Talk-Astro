class SendOtpModal {
    String message;
    int otp;
    String result;
    String type;
    User user;

    SendOtpModal({this.message, this.otp, this.result, this.type, this.user});

    factory SendOtpModal.fromJson(Map<String, dynamic> json) {
        return SendOtpModal(
            message: json['message'],
            otp: json['otp'],
            result: json['result'],
            type: json['type'],
            user: json['user'] != null ? User.fromJson(json['user']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['otp'] = this.otp;
        data['result'] = this.result;
        data['type'] = this.type;
        if (this.user != null) {
            data['user'] = this.user.toJson();
        }
        return data;
    }
}

class User {
    String country_code;
    String email;
    String image;
    String name;
    String phone;
    String userID;

    User({this.country_code, this.email, this.image, this.name, this.phone, this.userID});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            country_code: json['country_code'],
            email: json['email'],
            image: json['image'],
            name: json['name'],
            phone: json['phone'],
            userID: json['userID'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['country_code'] = this.country_code;
        data['email'] = this.email;
        data['image'] = this.image;
        data['name'] = this.name;
        data['phone'] = this.phone;
        data['userID'] = this.userID;
        return data;
    }
}
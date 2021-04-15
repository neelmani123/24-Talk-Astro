class LoginModal {
    String message;
    String result;
    User user;

    LoginModal({this.message, this.result, this.user});

    factory LoginModal.fromJson(Map<String, dynamic> json) {
        return LoginModal(
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
    String added_on;
    String address;
    String auth;
    String call_min;
    String chat_min;
    String country_code;
    String email;
    String image;
    String is_active;
    String is_busy;
    String is_verified;
    String name;
    String otp;
    String phone;
    String referral_code;
    String referred_by;
    String updated_on;
    String userID;
    String wallet;
    String wallet_oversea;

    User({this.added_on, this.address, this.auth, this.call_min, this.chat_min, this.country_code, this.email, this.image, this.is_active, this.is_busy, this.is_verified, this.name, this.otp, this.phone, this.referral_code, this.referred_by, this.updated_on, this.userID, this.wallet, this.wallet_oversea});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            added_on: json['added_on'],
            address: json['address'],
            auth: json['auth'],
            call_min: json['call_min'],
            chat_min: json['chat_min'],
            country_code: json['country_code'],
            email: json['email'],
            image: json['image'],
            is_active: json['is_active'],
            is_busy: json['is_busy'],
            is_verified: json['is_verified'],
            name: json['name'],
            otp: json['otp'],
            phone: json['phone'],
            referral_code: json['referral_code'],
            referred_by: json['referred_by'],
            updated_on: json['updated_on'],
            userID: json['userID'],
            wallet: json['wallet'],
            wallet_oversea: json['wallet_oversea'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['added_on'] = this.added_on;
        data['address'] = this.address;
        data['auth'] = this.auth;
        data['call_min'] = this.call_min;
        data['chat_min'] = this.chat_min;
        data['country_code'] = this.country_code;
        data['email'] = this.email;
        data['image'] = this.image;
        data['is_active'] = this.is_active;
        data['is_busy'] = this.is_busy;
        data['is_verified'] = this.is_verified;
        data['name'] = this.name;
        data['otp'] = this.otp;
        data['phone'] = this.phone;
        data['referral_code'] = this.referral_code;
        data['referred_by'] = this.referred_by;
        data['updated_on'] = this.updated_on;
        data['userID'] = this.userID;
        data['wallet'] = this.wallet;
        data['wallet_oversea'] = this.wallet_oversea;
        return data;
    }
}
class HomeModal {
    String message;
    String result;
    User user;

    HomeModal({this.message, this.result, this.user});

    factory HomeModal.fromJson(Map<String, dynamic> json) {
        return HomeModal(
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
    String email;
    String name;
    String phone;
    String userID;
    String wallet;
    String wallet_oversea;

    User({this.email, this.name, this.phone, this.userID, this.wallet, this.wallet_oversea});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            email: json['email'],
            name: json['name'],
            phone: json['phone'],
            userID: json['userID'],
            wallet: json['wallet'],
            wallet_oversea: json['wallet_oversea'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['name'] = this.name;
        data['phone'] = this.phone;
        data['userID'] = this.userID;
        data['wallet'] = this.wallet;
        data['wallet_oversea'] = this.wallet_oversea;
        return data;
    }
}
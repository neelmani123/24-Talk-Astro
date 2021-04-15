class SignUpModal {
    String country_code;
    String email;
    String message;
    String mobile;
    String name;
    String referral_code;
    String referral_userID;
    String result;
    int user_id;
    int wallet;

    SignUpModal({this.country_code, this.email, this.message, this.mobile, this.name, this.referral_code, this.referral_userID, this.result, this.user_id, this.wallet});

    factory SignUpModal.fromJson(Map<String, dynamic> json) {
        return SignUpModal(
            country_code: json['country_code'],
            email: json['email'],
            message: json['message'],
            mobile: json['mobile'],
            name: json['name'],
            referral_code: json['referral_code'],
            referral_userID: json['referral_userID'],
            result: json['result'],
            user_id: json['user_id'],
            wallet: json['wallet'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['country_code'] = this.country_code;
        data['email'] = this.email;
        data['message'] = this.message;
        data['mobile'] = this.mobile;
        data['name'] = this.name;
        data['referral_code'] = this.referral_code;
        data['referral_userID'] = this.referral_userID;
        data['result'] = this.result;
        data['user_id'] = this.user_id;
        data['wallet'] = this.wallet;
        return data;
    }
}
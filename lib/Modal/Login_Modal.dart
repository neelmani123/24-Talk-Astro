class LoginRequest {
    String email;
    String password;

    LoginRequest({this.email, this.password});

    factory LoginRequest.fromJson(Map<String, dynamic> json) {
        return LoginRequest(
            email: json['email'],
            password: json['password'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['password'] = this.password;
        return data;
    }
}

class LoginRespose {
    String token;

    LoginRespose({this.token});

    factory LoginRespose.fromJson(Map<String, dynamic> json) {
        return LoginRespose(
            token: json['token'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['token'] = this.token;
        return data;
    }
}
class ValidateOtpModal {
    String message;
    bool status;

    ValidateOtpModal({this.message, this.status});

    factory ValidateOtpModal.fromJson(Map<String, dynamic> json) {
        return ValidateOtpModal(
            message: json['message'],
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status'] = this.status;
        return data;
    }
}
class SuccessfulRegistrationModel {
  final String message;
  final String refresh;
  final String accessToken;

  SuccessfulRegistrationModel({required this.message, required this.refresh, required this.accessToken});


 factory SuccessfulRegistrationModel.fromJson(Map<String, dynamic> json) {
    return SuccessfulRegistrationModel(
      message: json['message'],
      refresh: json['refresh'],
      accessToken: json['access'],
    );
  }

}


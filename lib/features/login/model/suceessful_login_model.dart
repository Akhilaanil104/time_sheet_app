class SuceessfulLoginModel {

  final String message;
  final int userId;
  final int employeeId;
  final String accessToken;
  final String refreshToken;

  SuceessfulLoginModel({required this.message,required this.userId,required this.employeeId,required this.accessToken,required this.refreshToken});    
  factory SuceessfulLoginModel.fromJson(Map<String, dynamic> json) {
    return SuceessfulLoginModel(
      message: json['message'],
      userId: json['user_id'],
      employeeId: json['employee_id'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}

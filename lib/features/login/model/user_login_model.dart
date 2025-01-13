class BUserLoginDataModel {
  final String businessEmail; // Business owner's email
  final String password; // Password for the account
  final String fcmToken; // Firebase token for push notifications

  BUserLoginDataModel({
    required this.businessEmail,
    required this.password,
    required this.fcmToken,
  });

  /// Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      "business_email": businessEmail,
      "password": password,
      "fcm_token": fcmToken,
    };
  }

  /// Factory constructor to create the model from JSON data
  factory BUserLoginDataModel.fromJson(Map<String, dynamic> json) {
    return BUserLoginDataModel(
      businessEmail: json["business_email"] as String,
      password: json["password"] as String,
      fcmToken: json["fcm_token"] as String,
    );
  }

  /// Create a new instance with modified fields
  BUserLoginDataModel copyWith({
    String? businessEmail,
    String? password,
    String? fcmToken,
  }) {
    return BUserLoginDataModel(
      businessEmail: businessEmail ?? this.businessEmail,
      password: password ?? this.password,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }
}


class UserLoginModel {
  final String username;
  final String password;

  UserLoginModel({required this.username, required this.password});
  //  Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
  // Factory constructor to create the model from JSON data
  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      username: json["username"] as String,
      password: json["password"] as String,
    );
  }
  UserLoginModel copyWith({
    String? username,
    String? password,
  }) {
    return UserLoginModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

}
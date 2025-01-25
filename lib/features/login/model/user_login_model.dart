// class BUserLoginDataModel {
//   final String businessEmail; // Business owner's email
//   final String password; // Password for the account
//   final String fcmToken; // Firebase token for push notifications

//   BUserLoginDataModel({
//     required this.businessEmail,
//     required this.password,
//     required this.fcmToken,
//   });

//   /// Convert the model to a JSON map
//   Map<String, dynamic> toJson() {
//     return {
//       "business_email": businessEmail,
//       "password": password,
//       "fcm_token": fcmToken,
//     };
//   }

//   /// Factory constructor to create the model from JSON data
//   factory BUserLoginDataModel.fromJson(Map<String, dynamic> json) {
//     return BUserLoginDataModel(
//       businessEmail: json["business_email"] as String,
//       password: json["password"] as String,
//       fcmToken: json["fcm_token"] as String,
//     );
//   }

//   /// Create a new instance with modified fields
//   BUserLoginDataModel copyWith({
//     String? businessEmail,
//     String? password,
//     String? fcmToken,
//   }) {
//     return BUserLoginDataModel(
//       businessEmail: businessEmail ?? this.businessEmail,
//       password: password ?? this.password,
//       fcmToken: fcmToken ?? this.fcmToken,
//     );
//   }
// }


// class UserLoginModel {
//   final String username;
//   final String password;

//   UserLoginModel({required this.username, required this.password});
//   //  Convert the model to a JSON map
//   Map<String, dynamic> toJson() {
//     return {
//       "username": username,
//       "password": password,
//     };
//   }
//   // Factory constructor to create the model from JSON data
//   factory UserLoginModel.fromJson(Map<String, dynamic> json) {
//     return UserLoginModel(
//       username: json["username"] as String,
//       password: json["password"] as String,
//     );
//   }
//   UserLoginModel copyWith({
//     String? username,
//     String? password,
//   }) {
//     return UserLoginModel(
//       username: username ?? this.username,
//       password: password ?? this.password,
//     );
//   }

// }



class LoginModel {
  String username;
  String password;
  String activity;
  String currentLocation;
  double currentLongitude;
  double currentLatitude;
  String state;
  String city;
  String street;
  String country;
  String postalCode;

  LoginModel({required this.username, required this.password, required this.activity,
      required this.currentLocation, required this.currentLongitude, required this.currentLatitude,
      required this.state, required this.city, required this.street, required this.country, required this.postalCode}); 

  // Convert the LoginModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "activity": activity,
      "current_location": currentLocation,
      "current_longitude": currentLongitude,
      "current_latitude": currentLatitude,
      "state": state,
      "city": city,
      "street": street,
      "country": country,
      "postal_code": postalCode
    };
  }

  // Create a LoginModel instance from a JSON map
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      activity: json['activity'] ?? '',
      currentLocation: json['current_location'] ?? '',
      currentLongitude: json['current_longitude'] ?? 0.0,
      currentLatitude: json['current_latitude'] ?? 0.0,
      state: json['state'] ?? '',
      city: json['city'] ?? '',
      street: json['street'] ?? '',
      country: json['country'] ?? '',
      postalCode: json['postal_code'] ?? '',
    );
  }
}
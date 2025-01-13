// class LoginModel {
//   String username;
//   String password;

//   LoginModel({required this.username, required this.password});

//   // Convert the LoginModel instance to a JSON map
//   Map<String, dynamic> toJson() {
//     return {
//       "username": username,
//       "password": password,
//     };
//   }

//   // Create a LoginModel instance from a JSON map
//   factory LoginModel.fromJson(Map<String, dynamic> json) {
//     return LoginModel(
//       username: json['username'] ?? '',
//       password: json['password'] ?? '',
//     );
//   }
// }
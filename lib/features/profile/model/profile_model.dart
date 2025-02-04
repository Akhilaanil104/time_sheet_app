


class ProfileModel {
  final int id;
  final String name;
  final String? profileImage;
  final String? profileImageUrl;
  final String email;
  final String phoneNumber;
  final String? payScale;
  final double payScaleAmount;
  final String currency;

  ProfileModel({
    required this.id,
    required this.name,
    this.profileImage,
    this.profileImageUrl,
    required this.email,
    required this.phoneNumber,
    this.payScale,
    required this.payScaleAmount,
    required this.currency,
  });

  /// Convert JSON to ProfileModel
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'No Name',
      profileImage: json['profile_image'], // Nullable field
      profileImageUrl: json['profile_image_url'], // Nullable field
      email: json['email'] ?? 'No Email',
      phoneNumber: json['phone_number'] ?? 'No Phone',
      payScale: json['pay_scale'], // Nullable field
      payScaleAmount: (json['pay_scale_amount'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency'] ?? 'Unknown Currency',
    );
  }

  /// Convert ProfileModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profile_image': profileImage,
      'profile_image_url': profileImageUrl,
      'email': email,
      'phone_number': phoneNumber,
      'pay_scale': payScale,
      'pay_scale_amount': payScaleAmount,
      'currency': currency,
    };
  }
}

class ProfileResponse {
  final String message;
  final List<ProfileModel> data;

  ProfileResponse({
    required this.message,
    required this.data,
  });

  factory ProfileResponse.fromJson(dynamic json) {
    // ✅ If API returns a single object, convert it to a list
    if (json is Map<String, dynamic> && json.containsKey("id")) {
      return ProfileResponse(
        message: "Single Profile",
        data: [ProfileModel.fromJson(json)], // Convert single object to list
      );
    }

    // ✅ If API returns a list of profiles
    return ProfileResponse(
      message: json['message'] ?? "No Message",
      data: (json['data'] as List?)?.map((profile) => ProfileModel.fromJson(profile)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.map((profile) => profile.toJson()).toList(),
    };
  }
}



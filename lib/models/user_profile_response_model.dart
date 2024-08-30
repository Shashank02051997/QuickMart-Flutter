class UserProfileResponseModel {
  UserProfileResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final int? code;
  final bool? status;
  final String? message;
  final UserProfileResult? result;

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return UserProfileResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      result: json["result"] == null
          ? null
          : UserProfileResult.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "result": result?.toJson(),
      };
}

class UserProfileResult {
  UserProfileResult({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.mobileNumber,
    required this.role,
    required this.dob,
    required this.gender,
    required this.email,
    required this.isEmailVerified,
    required this.isMobileVerified,
    required this.isBlocked,
    required this.about,
    required this.profilePic,
    required this.address,
    required this.firebaseToken,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? firstname;
  final String? lastname;
  final String? mobileNumber;
  final String? role;
  final dynamic dob;
  final String? gender;
  final String? email;
  final bool? isEmailVerified;
  final bool? isMobileVerified;
  final bool? isBlocked;
  final dynamic about;
  final String? profilePic;
  final String? address;
  final dynamic firebaseToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory UserProfileResult.fromJson(Map<String, dynamic> json) {
    return UserProfileResult(
      id: json["id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      mobileNumber: json["mobile_number"],
      role: json["role"],
      dob: json["dob"],
      gender: json["gender"],
      email: json["email"],
      isEmailVerified: json["is_email_verified"],
      isMobileVerified: json["is_mobile_verified"],
      isBlocked: json["is_blocked"],
      about: json["about"],
      profilePic: json["profile_pic"],
      address: json["address"],
      firebaseToken: json["firebase_token"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "mobile_number": mobileNumber,
        "role": role,
        "dob": dob,
        "gender": gender,
        "email": email,
        "is_email_verified": isEmailVerified,
        "is_mobile_verified": isMobileVerified,
        "is_blocked": isBlocked,
        "about": about,
        "profile_pic": profilePic,
        "address": address,
        "firebase_token": firebaseToken,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

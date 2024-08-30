class SignInResponseModel {
  SignInResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final int? code;
  final bool? status;
  final String? message;
  final SignInResponseResult? result;

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return SignInResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      result: json["result"] == null
          ? null
          : SignInResponseResult.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "result": result?.toJson(),
      };
}

class SignInResponseResult {
  SignInResponseResult({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.mobileNumber,
    required this.role,
    required this.address,
    required this.profilePic,
    required this.token,
  });

  final int? id;
  String? firstname;
  String? lastname;
  String? email;
  final String? mobileNumber;
  final String? role;
  String? address;
  String? profilePic;
  final String? token;

  factory SignInResponseResult.fromJson(Map<String, dynamic> json) {
    return SignInResponseResult(
      id: json["id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      email: json["email"],
      mobileNumber: json["mobile_number"],
      role: json["role"],
      address: json["address"],
      profilePic: json["profile_pic"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "mobile_number": mobileNumber,
        "role": role,
        "address": address,
        "profile_pic": profilePic,
        "token": token,
      };
}

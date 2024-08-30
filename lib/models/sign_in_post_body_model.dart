class SignInPostBodyModel {
  SignInPostBodyModel({
    required this.mobileNumber,
    this.idToken,
    this.uid,
  });

  final String? mobileNumber;
  final String? idToken;
  final String? uid;

  factory SignInPostBodyModel.fromJson(Map<String, dynamic> json) {
    return SignInPostBodyModel(
      mobileNumber: json["mobile_number"],
      idToken: json["id_token"],
      uid: json["uid"],
    );
  }

  Map<String, dynamic> toJson() => {
        "mobile_number": mobileNumber,
        "id_token": idToken,
        "uid": uid,
      };
}

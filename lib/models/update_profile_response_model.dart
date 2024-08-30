class UpdateProfileResponseModel {
  UpdateProfileResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final int? code;
  final bool? status;
  final String? message;
  final Result? result;

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "result": result?.toJson(),
      };
}

class Result {
  Result({
    required this.firstname,
  });

  final String? firstname;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      firstname: json["firstname"],
    );
  }

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
      };
}

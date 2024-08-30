class AddOrderResponseModel {
  AddOrderResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final int? code;
  final bool? status;
  final String? message;
  final AddOrderResult? result;

  factory AddOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return AddOrderResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      result: json["result"] == null
          ? null
          : AddOrderResult.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "result": result?.toJson(),
      };
}

class AddOrderResult {
  AddOrderResult({
    required this.status,
    required this.id,
    required this.userId,
    required this.totalAmount,
    required this.updatedAt,
    required this.createdAt,
  });

  final String? status;
  final int? id;
  final int? userId;
  final int? totalAmount;
  final DateTime? updatedAt;
  final DateTime? createdAt;

  factory AddOrderResult.fromJson(Map<String, dynamic> json) {
    return AddOrderResult(
      status: json["status"],
      id: json["id"],
      userId: json["user_id"],
      totalAmount: json["total_amount"],
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "id": id,
        "user_id": userId,
        "total_amount": totalAmount,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
      };
}

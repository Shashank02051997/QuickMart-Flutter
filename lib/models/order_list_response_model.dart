class OrderListResponseModel {
  OrderListResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final int? code;
  final bool? status;
  final String? message;
  final List<OrderListResult> result;

  factory OrderListResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderListResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      result: json["result"] == null
          ? []
          : List<OrderListResult>.from(
              json["result"]!.map((x) => OrderListResult.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class OrderListResult {
  OrderListResult({
    required this.id,
    required this.userId,
    required this.status,
    required this.totalAmount,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? userId;
  final String? status;
  final int? totalAmount;
  final String? createdAt;
  final String? updatedAt;

  factory OrderListResult.fromJson(Map<String, dynamic> json) {
    return OrderListResult(
      id: json["id"],
      userId: json["user_id"],
      status: json["status"],
      totalAmount: json["total_amount"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "status": status,
        "total_amount": totalAmount,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

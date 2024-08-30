class AddOrderItemsResponseModel {
  AddOrderItemsResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.results,
  });

  final int? code;
  final bool? status;
  final String? message;
  final List<Result> results;

  factory AddOrderItemsResponseModel.fromJson(Map<String, dynamic> json) {
    return AddOrderItemsResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      results: json["results"] == null
          ? []
          : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "results": results.map((x) => x.toJson()).toList(),
      };
}

class Result {
  Result({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.orderId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? productId;
  final int? quantity;
  final String? orderId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json["id"],
      productId: json["product_id"],
      quantity: json["quantity"],
      orderId: json["order_id"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "quantity": quantity,
        "order_id": orderId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

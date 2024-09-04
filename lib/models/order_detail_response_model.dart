class OrderDetailResponseModel {
  OrderDetailResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final int? code;
  final bool? status;
  final String? message;
  final List<OrderDetailResult> result;

  factory OrderDetailResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      result: json["result"] == null
          ? []
          : List<OrderDetailResult>.from(
              json["result"]!.map((x) => OrderDetailResult.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class OrderDetailResult {
  OrderDetailResult({
    required this.orderId,
    required this.productId,
    required this.orderItemQuantityCount,
    required this.name,
    required this.imageUrl,
    required this.finalPrice,
    required this.quantity,
    required this.categoryId,
    required this.isBestSelling,
    required this.id,
    required this.userId,
    required this.status,
    required this.totalAmount,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? orderId;
  final int? productId;
  final int? orderItemQuantityCount;
  final String? name;
  final String? imageUrl;
  final dynamic finalPrice;
  final String? quantity;
  final int? categoryId;
  final int? isBestSelling;
  final int? id;
  final int? userId;
  final String? status;
  final dynamic totalAmount;
  final String? createdAt;
  final String? updatedAt;

  factory OrderDetailResult.fromJson(Map<String, dynamic> json) {
    return OrderDetailResult(
      orderId: json["order_id"],
      productId: json["product_id"],
      orderItemQuantityCount: json["order_item_quantity_count"],
      name: json["name"],
      imageUrl: json["image_url"],
      finalPrice: json["final_price"],
      quantity: json["quantity"],
      categoryId: json["category_id"],
      isBestSelling: json["is_best_selling"],
      id: json["id"],
      userId: json["user_id"],
      status: json["status"],
      totalAmount: json["total_amount"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "product_id": productId,
        "order_item_quantity_count": orderItemQuantityCount,
        "name": name,
        "image_url": imageUrl,
        "final_price": finalPrice,
        "quantity": quantity,
        "category_id": categoryId,
        "is_best_selling": isBestSelling,
        "id": id,
        "user_id": userId,
        "status": status,
        "total_amount": totalAmount,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

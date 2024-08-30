class AddOrderItemsPostBodyModel {
  AddOrderItemsPostBodyModel({
    required this.orderItems,
  });

  final List<OrderItem> orderItems;

  factory AddOrderItemsPostBodyModel.fromJson(Map<String, dynamic> json) {
    return AddOrderItemsPostBodyModel(
      orderItems: json["order_items"] == null
          ? []
          : List<OrderItem>.from(
              json["order_items"]!.map((x) => OrderItem.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "order_items": orderItems.map((x) => x.toJson()).toList(),
      };
}

class OrderItem {
  OrderItem({
    required this.productId,
    required this.quantity,
  });

  final int? productId;
  final int? quantity;

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json["product_id"],
      quantity: json["quantity"],
    );
  }

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
      };
}

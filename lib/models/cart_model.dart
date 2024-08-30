class CartModel {
  CartModel({
    required this.productId,
    required this.productName,
    required this.productImageUrl,
    required this.productQuantity,
    required this.productPrice,
    this.quantityCount,
    this.price,
  });

  final int? productId;
  final String? productName;
  final String? productImageUrl;
  final String? productQuantity;
  final double? productPrice;
  int? quantityCount;
  double? price;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productId: json["product_id"],
      productName: json["product_name"],
      productImageUrl: json["product_image_url"],
      productQuantity: json["product_quantity"],
      productPrice: json["product_price"],
      quantityCount: json["quantity_count"],
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_image_url": productImageUrl,
        "product_quantity": productQuantity,
        "product_price": productPrice,
        "quantity_count": quantityCount,
        "price": price,
      };
}

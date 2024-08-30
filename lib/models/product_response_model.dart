class ProductResponseModel {
  ProductResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final int? code;
  final bool? status;
  final String? message;
  final List<ProductResult> result;

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      result: json["result"] == null
          ? []
          : List<ProductResult>.from(
              json["result"]!.map((x) => ProductResult.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class ProductResult {
  ProductResult({
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.shelfLife,
    required this.manufacturer,
    required this.disclaimer,
    required this.actualPrice,
    required this.discountPrice,
    required this.finalPrice,
    required this.stock,
    required this.imageUrl,
    required this.categoryId,
    required this.isBestSelling,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? quantity;
  final int? shelfLife;
  final String? manufacturer;
  final String? disclaimer;
  final double? actualPrice;
  final double? discountPrice;
  final double? finalPrice;
  final int? stock;
  final String? imageUrl;
  final int? categoryId;
  final bool? isBestSelling;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ProductResult.fromJson(Map<String, dynamic> json) {
    return ProductResult(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      quantity: json["quantity"],
      shelfLife: json["shelf_life"],
      manufacturer: json["manufacturer"],
      disclaimer: json["disclaimer"],
      actualPrice: json["actual_price"],
      discountPrice: json["discount_price"],
      finalPrice: json["final_price"],
      stock: json["stock"],
      imageUrl: json["image_url"],
      categoryId: json["category_id"],
      isBestSelling: json["is_best_selling"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "quantity": quantity,
        "shelf_life": shelfLife,
        "manufacturer": manufacturer,
        "disclaimer": disclaimer,
        "actual_price": actualPrice,
        "discount_price": discountPrice,
        "final_price": finalPrice,
        "stock": stock,
        "image_url": imageUrl,
        "category_id": categoryId,
        "is_best_selling": isBestSelling,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

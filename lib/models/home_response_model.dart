class HomeResponseModel {
  HomeResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final int? code;
  final bool? status;
  final String? message;
  final HomeResult? result;

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      result:
          json["result"] == null ? null : HomeResult.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "result": result?.toJson(),
      };
}

class HomeResult {
  HomeResult({
    required this.exclusiveOffers,
    required this.bestSellings,
    required this.categories,
    required this.allProducts,
  });

  final List<AllProduct> exclusiveOffers;
  final List<AllProduct> bestSellings;
  final List<Category> categories;
  final List<AllProduct> allProducts;

  factory HomeResult.fromJson(Map<String, dynamic> json) {
    return HomeResult(
      exclusiveOffers: json["exclusive_offers"] == null
          ? []
          : List<AllProduct>.from(
              json["exclusive_offers"]!.map((x) => AllProduct.fromJson(x))),
      bestSellings: json["best_sellings"] == null
          ? []
          : List<AllProduct>.from(
              json["best_sellings"]!.map((x) => AllProduct.fromJson(x))),
      categories: json["categories"] == null
          ? []
          : List<Category>.from(
              json["categories"]!.map((x) => Category.fromJson(x))),
      allProducts: json["all_products"] == null
          ? []
          : List<AllProduct>.from(
              json["all_products"]!.map((x) => AllProduct.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "exclusive_offers": exclusiveOffers.map((x) => x.toJson()).toList(),
        "best_sellings": bestSellings.map((x) => x.toJson()).toList(),
        "categories": categories.map((x) => x.toJson()).toList(),
        "all_products": allProducts.map((x) => x.toJson()).toList(),
      };
}

class AllProduct {
  AllProduct({
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
  final dynamic actualPrice;
  final dynamic discountPrice;
  final dynamic finalPrice;
  final int? stock;
  final String? imageUrl;
  final int? categoryId;
  final int? isBestSelling;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory AllProduct.fromJson(Map<String, dynamic> json) {
    return AllProduct(
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
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      imageUrl: json["image_url"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image_url": imageUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

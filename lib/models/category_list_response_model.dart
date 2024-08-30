class CategoryListResponseModel {
  CategoryListResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final int? code;
  final bool? status;
  final String? message;
  final List<CategoryListResult> result;

  factory CategoryListResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryListResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      result: json["result"] == null
          ? []
          : List<CategoryListResult>.from(
              json["result"]!.map((x) => CategoryListResult.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class CategoryListResult {
  CategoryListResult({
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

  factory CategoryListResult.fromJson(Map<String, dynamic> json) {
    return CategoryListResult(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      imageUrl: json["image_url"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image_url": imageUrl,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

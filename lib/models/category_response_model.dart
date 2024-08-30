class CategoryResponseModel {
  CategoryResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final int? code;
  final bool? status;
  final String? message;
  final List<CategoryResult> result;

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      result: json["result"] == null
          ? []
          : List<CategoryResult>.from(
              json["result"]!.map((x) => CategoryResult.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class CategoryResult {
  CategoryResult({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CategoryResult.fromJson(Map<String, dynamic> json) {
    return CategoryResult(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class AllAvatarResponseModel {
  AllAvatarResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final int? code;
  final bool? status;
  final String? message;
  final List<AllAvatarResult> result;

  factory AllAvatarResponseModel.fromJson(Map<String, dynamic> json) {
    return AllAvatarResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      result: json["result"] == null
          ? []
          : List<AllAvatarResult>.from(
              json["result"]!.map((x) => AllAvatarResult.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class AllAvatarResult {
  AllAvatarResult({
    required this.id,
    required this.url,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? url;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory AllAvatarResult.fromJson(Map<String, dynamic> json) {
    return AllAvatarResult(
      id: json["id"],
      url: json["url"],
      name: json["name"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

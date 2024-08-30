class NotificationResponseModel {
  NotificationResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final int? code;
  final bool? status;
  final String? message;
  final List<NotificationResult> result;

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      result: json["result"] == null
          ? []
          : List<NotificationResult>.from(
              json["result"]!.map((x) => NotificationResult.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "result": result.map((x) => x.toJson()).toList(),
      };
}

class NotificationResult {
  NotificationResult({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.type,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? userId;
  final String? title;
  final String? message;
  final String? type;
  final bool? isRead;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory NotificationResult.fromJson(Map<String, dynamic> json) {
    return NotificationResult(
      id: json["id"],
      userId: json["user_id"],
      title: json["title"],
      message: json["message"],
      type: json["type"],
      isRead: json["isRead"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "message": message,
        "type": type,
        "isRead": isRead,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

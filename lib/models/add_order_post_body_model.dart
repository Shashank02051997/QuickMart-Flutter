class AddOrderPostBodyModel {
  AddOrderPostBodyModel({
    required this.totalAmount,
  });

  final int? totalAmount;

  factory AddOrderPostBodyModel.fromJson(Map<String, dynamic> json) {
    return AddOrderPostBodyModel(
      totalAmount: json["total_amount"],
    );
  }

  Map<String, dynamic> toJson() => {
        "total_amount": totalAmount,
      };
}

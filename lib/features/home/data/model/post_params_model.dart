class PostParamsModel {
  final bool isDirect;
  final String paxCategory;
  final String refundable;

  const PostParamsModel({
    required this.isDirect,
    this.paxCategory = "NA",
    this.refundable = "",
  });

  Map<String, dynamic> toJson() {
    return {
      "IsDirect": isDirect,
      "PaxCategory": paxCategory,
      "Refundable": refundable,
    };
  }
}

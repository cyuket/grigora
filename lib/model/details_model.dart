class DetailModel {
  final dynamic deliveryFee;
  final String cuisines;
  final String prepTime;
  final bool busyStatus;
  final dynamic rating;
  final dynamic review;
  final String profileImage;

  DetailModel({
    this.busyStatus,
    this.cuisines,
    this.deliveryFee,
    this.prepTime,
    this.rating,
    this.review,
    this.profileImage,
  });

  factory DetailModel.fromJson(Map<String, dynamic> data) {
    if (data == null) return null;
    return DetailModel(
      busyStatus: data["busy_status"],
      cuisines: data["cuisines"],
      deliveryFee: data["delivery_fee"],
      prepTime: data["estimated_preparing_time"],
      rating: data["total_rating"],
      review: data["total_review"],
      profileImage: data["restaurant_image"],
    );
  }
}

class Review {
  final String reviewerId;
  final int rating;
  final String comment;
  final DateTime createdAt;

  Review({
    required this.reviewerId,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });
}

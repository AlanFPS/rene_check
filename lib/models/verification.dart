class Verification {
  final String userId;
  final String type; // e.g., 'ID', 'phone', 'facial'
  final bool status; // true if verified
  final DateTime verifiedOnDate;

  Verification({
    required this.userId,
    required this.type,
    required this.status,
    required this.verifiedOnDate,
  });
}

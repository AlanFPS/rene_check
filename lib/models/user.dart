class User {
  final String id;
  String name;
  String email;
  final String profilePictureUrl;
  final bool isIdVerified;
  final bool isPhoneVerified;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePictureUrl,
    this.isIdVerified = false,
    this.isPhoneVerified = false,
  });
}

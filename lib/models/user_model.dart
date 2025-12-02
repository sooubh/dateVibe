class UserModel {
  final String id;
  final String name;
  final String email;
  final String? bio;
  final List<String>? photoUrls;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.bio,
    this.photoUrls,
  });
}

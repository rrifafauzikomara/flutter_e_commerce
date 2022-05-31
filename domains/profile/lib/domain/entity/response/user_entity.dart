class UserEntity {
  UserEntity({
    required this.id,
    required this.username,
    required this.role,
    required this.imageUrl,
    required this.fullName,
    required this.city,
    required this.simpleAddress,
  });

  final String id;
  final String username;
  final String role;
  final String imageUrl;
  final String fullName;
  final String city;
  final String simpleAddress;
}

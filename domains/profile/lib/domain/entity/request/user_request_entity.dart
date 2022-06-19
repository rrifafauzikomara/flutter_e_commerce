class UserRequestEntity {
  UserRequestEntity({
    required this.fullName,
    required this.simpleAddress,
    required this.fcmToken,
    required this.fcmServerKey,
  });

  final String fullName;
  final String simpleAddress;
  final String fcmToken;
  final String fcmServerKey;
}

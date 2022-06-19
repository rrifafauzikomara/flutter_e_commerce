class UserRequestDto {
  UserRequestDto({
    required this.fullName,
    required this.simpleAddress,
    required this.fcmToken,
    required this.fcmServerKey,
  });

  final String fullName;
  final String simpleAddress;
  final String fcmToken;
  final String fcmServerKey;

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "simple_address": simpleAddress,
        "fcmToken": fcmToken,
        "fcmServerKey": fcmServerKey,
      };
}

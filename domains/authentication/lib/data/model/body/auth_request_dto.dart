class AuthRequestDto {
  AuthRequestDto({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

import 'dart:convert';

class AuthResponseDto {
  final String token;
  final String username;
  final List<String> roles;

  AuthResponseDto({
    required this.token,
    required this.username,
    required this.roles,
  });

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthResponseDto(
      token: json['token'] ?? '',
      username: json['username'] ?? '',
      roles: List<String>.from(
          json['roles'].map((r) => r.toString().trim())),
    );
  }

  static AuthResponseDto fromJsonString(String str) =>
      AuthResponseDto.fromJson(jsonDecode(str));

  Map<String, dynamic> toJson() => {
    'token': token,
    'username': username,
    'roles': roles,
  };
}

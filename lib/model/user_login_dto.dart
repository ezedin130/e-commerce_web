import 'dart:convert';

class UserLoginDto {
  final String userName;
  final String password;

  UserLoginDto({required this.userName, required this.password});

  Map<String, dynamic> toJson() => {
    'userName': userName,
    'password': password,
  };

  String toJsonString() => jsonEncode(toJson());
}

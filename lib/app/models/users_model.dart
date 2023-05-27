import 'dart:convert';

class UserModel {
  final String regNo;
  final String role;
  final String username;
  UserModel({
    required this.regNo,
    required this.role,
    required this.username,
  });

  UserModel copyWith({
    String? regNo,
    String? role,
    String? username,
  }) {
    return UserModel(
      regNo: regNo ?? this.regNo,
      role: role ?? this.role,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'regNo': regNo,
      'role': role,
      'username': username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      regNo: map['regNo'] as String,
      role: map['role'] as String,
      username: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

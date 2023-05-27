import 'dart:convert';

import 'package:attendance/app/models/users_model.dart';

class ClassesModel {
  final String classId;
  final String classCode;
  final String name;
  final UserModel createdBy;
  ClassesModel({
    required this.classId,
    required this.classCode,
    required this.name,
    required this.createdBy,
  });

  ClassesModel copyWith({
    String? classId,
    String? classCode,
    String? name,
    UserModel? createdBy,
  }) {
    return ClassesModel(
      classId: classId ?? this.classId,
      classCode: classCode ?? this.classCode,
      name: name ?? this.name,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classId': classId,
      'classCode': classCode,
      'name': name,
      'createdBy': createdBy.toMap(),
    };
  }

  factory ClassesModel.fromMap(Map<String, dynamic> map) {
    return ClassesModel(
      classId: map['classId'] as String,
      classCode: map['classCode'] as String,
      name: map['name'] as String,
      createdBy: UserModel.fromMap(map['createdBy'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassesModel.fromJson(String source) =>
      ClassesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClassesModel(classId: $classId, classCode: $classCode, name: $name, createdBy: $createdBy)';
  }

  @override
  bool operator ==(covariant ClassesModel other) {
    if (identical(this, other)) return true;

    return other.classId == classId &&
        other.classCode == classCode &&
        other.name == name &&
        other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return classId.hashCode ^
        classCode.hashCode ^
        name.hashCode ^
        createdBy.hashCode;
  }
}

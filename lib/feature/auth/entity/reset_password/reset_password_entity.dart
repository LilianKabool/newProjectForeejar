import 'package:freezed_annotation/freezed_annotation.dart';
part 'reset_password_entity.g.dart';
@JsonSerializable()
class ResetPasswordEntity{
  String message;
  Data data;
  ResetPasswordEntity({
    required this.message,
    required this.data,
  });
  factory ResetPasswordEntity.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordEntityToJson(this);
}
@JsonSerializable()
class Data {
  int id;
  String firstName;
  String lastName;
  dynamic gender;
  dynamic birthday;
  dynamic address;
  dynamic phone;
  dynamic facebook;
  dynamic twiter;
  dynamic instagram;
  dynamic telegram;
  int active;
  int user;
  int company;
  int salon;
  String email;
  DateTime emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.birthday,
    required this.address,
    required this.phone,
    required this.facebook,
    required this.twiter,
    required this.instagram,
    required this.telegram,
    required this.active,
    required this.user,
    required this.company,
    required this.salon,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

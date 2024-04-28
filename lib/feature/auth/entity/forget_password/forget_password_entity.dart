
  import 'package:freezed_annotation/freezed_annotation.dart';
  part 'forget_password_entity.g.dart';
  @JsonSerializable()
  class ForgetPasswordEntity{
  String message;
  ForgetPasswordEntity({
  required this.message,

  });
  factory ForgetPasswordEntity.fromJson(Map<String, dynamic> json) =>
  _$ForgetPasswordEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordEntityToJson(this);
  }


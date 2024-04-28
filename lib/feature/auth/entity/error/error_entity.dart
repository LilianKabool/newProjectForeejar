import 'package:freezed_annotation/freezed_annotation.dart';

part'error_entity.g.dart';
@JsonSerializable()
class ErrorEntity {
  String message;
  Errors errors;

  ErrorEntity({
    required this.message,
    required this.errors,
  });

  factory ErrorEntity.fromJson(Map<String, dynamic> json) =>
      _$ErrorEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorEntityToJson(this);

}
@JsonSerializable()
class Errors {
  List<String> password;
  List<String> email;

  Errors({
    required this.password,
    required this.email,
  });
  factory Errors.fromJson(Map<String, dynamic> json) =>
      _$ErrorsFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorsToJson(this);
}


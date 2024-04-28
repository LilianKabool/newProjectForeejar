import 'package:json_annotation/json_annotation.dart';

part 'profile_entity.g.dart';

@JsonSerializable()
class BaseProfileEntity {
  final String message;
  final ProfileEntity profile;

  BaseProfileEntity({required this.message, required this.profile});

  factory BaseProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseProfileEntityFromJson(json);
  Map<String, dynamic> toJson() => _$BaseProfileEntityToJson(this);
}

@JsonSerializable()
class ProfileEntity {
  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  final String gender;

  @JsonKey(name: 'Birthday')
  final String birthday;

  final String address;
  final String phone;

  ProfileEntity({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.birthday,
    required this.address,
    required this.phone,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfileEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileEntityToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseProfileEntity _$BaseProfileEntityFromJson(Map<String, dynamic> json) =>
    BaseProfileEntity(
      message: json['message'] as String,
      profile: ProfileEntity.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseProfileEntityToJson(BaseProfileEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'profile': instance.profile,
    };

ProfileEntity _$ProfileEntityFromJson(Map<String, dynamic> json) =>
    ProfileEntity(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      gender: json['gender'] as String,
      birthday: json['Birthday'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ProfileEntityToJson(ProfileEntity instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'gender': instance.gender,
      'Birthday': instance.birthday,
      'address': instance.address,
      'phone': instance.phone,
    };

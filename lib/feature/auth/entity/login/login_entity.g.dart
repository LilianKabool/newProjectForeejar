// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginEntity _$LoginEntityFromJson(Map<String, dynamic> json) => LoginEntity(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginEntityToJson(LoginEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'token': instance.token,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      gender: json['gender'] as String,
      birthday: DateTime.parse(json['birthday'] as String),
      address: json['address'] as String,
      phone: json['phone'] as String,
      facebook: json['facebook'],
      twiter: json['twiter'],
      instagram: json['instagram'],
      telegram: json['telegram'],
      active: json['active'] as int,
      user: json['user'] as int,
      company: json['company'] as int,
      salon: json['salon'] as int,
      email: json['email'] as String,
      emailVerifiedAt: DateTime.parse(json['emailVerifiedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'birthday': instance.birthday.toIso8601String(),
      'address': instance.address,
      'phone': instance.phone,
      'facebook': instance.facebook,
      'twiter': instance.twiter,
      'instagram': instance.instagram,
      'telegram': instance.telegram,
      'active': instance.active,
      'user': instance.user,
      'company': instance.company,
      'salon': instance.salon,
      'email': instance.email,
      'emailVerifiedAt': instance.emailVerifiedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

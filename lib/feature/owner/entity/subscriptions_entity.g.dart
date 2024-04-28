// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseSubscriptionsEntity _$BaseSubscriptionsEntityFromJson(
        Map<String, dynamic> json) =>
    BaseSubscriptionsEntity(
      json['message'] as String,
      (json['subscriptions'] as List<dynamic>)
          .map((e) => SubscriptionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BaseSubscriptionsEntityToJson(
        BaseSubscriptionsEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'subscriptions': instance.subscriptions,
    };

SubscriptionEntity _$SubscriptionEntityFromJson(Map<String, dynamic> json) =>
    SubscriptionEntity(
      json['id'] as int,
      json['admin_id'] as int,
      json['title'] as String,
      json['title_en'] as String,
      json['duration'] as int,
      json['price'] as int,
      json['deleted'] as int,
    );

Map<String, dynamic> _$SubscriptionEntityToJson(SubscriptionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'admin_id': instance.adminId,
      'title': instance.title,
      'title_en': instance.englishTitle,
      'duration': instance.duration,
      'price': instance.price,
      'deleted': instance.deleted,
    };

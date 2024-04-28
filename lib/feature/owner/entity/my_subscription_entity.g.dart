// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_subscription_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MySubscriptionEntity _$MySubscriptionEntityFromJson(
        Map<String, dynamic> json) =>
    MySubscriptionEntity(
      json['message'] as String,
      (json['subscriptions'] as List<dynamic>)
          .map(
              (e) => SubscriptionDataEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MySubscriptionEntityToJson(
        MySubscriptionEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'subscriptions': instance.subscriptions,
    };

SubscriptionDataEntity _$SubscriptionDataEntityFromJson(
        Map<String, dynamic> json) =>
    SubscriptionDataEntity(
      json['id'] as int,
      json['user_id'] as int,
      json['subscription_id'] as int,
      json['start_date'] as String,
      json['end_date'] as String,
      json['value'] as int,
    );

Map<String, dynamic> _$SubscriptionDataEntityToJson(
        SubscriptionDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'subscription_id': instance.subscriptionId,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'value': instance.value,
    };

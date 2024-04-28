// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_subscruption_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseActiveSubscriptionEntity _$BaseActiveSubscriptionEntityFromJson(
        Map<String, dynamic> json) =>
    BaseActiveSubscriptionEntity(
      message: json['message'] as String,
      subscriptions: (json['subscriptions'] as List<dynamic>)
          .map((e) =>
              ActiveSubscriptionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BaseActiveSubscriptionEntityToJson(
        BaseActiveSubscriptionEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'subscriptions': instance.subscriptions,
    };

ActiveSubscriptionEntity _$ActiveSubscriptionEntityFromJson(
        Map<String, dynamic> json) =>
    ActiveSubscriptionEntity(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      subscriptionId: json['subscription_id'] as int,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      value: json['value'] as int,
    );

Map<String, dynamic> _$ActiveSubscriptionEntityToJson(
        ActiveSubscriptionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'subscription_id': instance.subscriptionId,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'value': instance.value,
    };

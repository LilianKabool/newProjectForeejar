import 'package:json_annotation/json_annotation.dart';

part 'active_subscruption_entity.g.dart';

@JsonSerializable()
class BaseActiveSubscriptionEntity {
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'subscriptions')
  final List<ActiveSubscriptionEntity> subscriptions;

  BaseActiveSubscriptionEntity({required this.message, required this.subscriptions});

  factory BaseActiveSubscriptionEntity.fromJson(Map<String, dynamic> json) => _$BaseActiveSubscriptionEntityFromJson(json);
  Map<String, dynamic> toJson() => _$BaseActiveSubscriptionEntityToJson(this);
}

@JsonSerializable()
class ActiveSubscriptionEntity {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'subscription_id')
  final int subscriptionId;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String endDate;
  @JsonKey(name: 'value')
  final int value;

  ActiveSubscriptionEntity({
    required this.id,
    required this.userId,
    required this.subscriptionId,
    required this.startDate,
    required this.endDate,
    required this.value,
  });

  factory ActiveSubscriptionEntity.fromJson(Map<String, dynamic> json) => _$ActiveSubscriptionEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ActiveSubscriptionEntityToJson(this);
}
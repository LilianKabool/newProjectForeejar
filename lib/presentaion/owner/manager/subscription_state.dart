part of 'subscription_cubit.dart';



@freezed
class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState.initial() = Initial;
  const factory SubscriptionState.loading() = Loading;
  const factory SubscriptionState.success({
    required BaseSubscriptionsEntity subscriptions,
    required Map<int, bool> selectedSubscriptions
  }) = SuccessSubscription;
  const factory SubscriptionState.error(NetworkExceptions networkExceptions) = Error;
}
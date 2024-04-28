part of 'active_subscription_cubit.dart';

@freezed
class ActiveSubscriptionState with _$ActiveSubscriptionState {
  const factory ActiveSubscriptionState.initial() = _Initial;
  const factory ActiveSubscriptionState.loading() = Loading;

  const factory ActiveSubscriptionState.success(BaseActiveSubscriptionEntity baseActiveSubscriptionEntity) = Success;

  const factory ActiveSubscriptionState.error(NetworkExceptions networkExceptions) =
      Error;}

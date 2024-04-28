part of 'subscripe_cubit.dart';

@freezed
class SubscripeState with _$SubscripeState {
  const factory SubscripeState.initial() = _Initial;
  const factory SubscripeState.loading() = Loading;

  const factory SubscripeState.success(BaseEntity baseEntity) = Success;

  const factory SubscripeState.error(NetworkExceptions networkExceptions) =
      Error;}

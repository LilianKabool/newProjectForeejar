part of 'get_profile_cubit.dart';

@freezed
class GetProfileState with _$GetProfileState {
  const factory GetProfileState.loading() = Loading;

  const factory GetProfileState.success(BaseProfileEntity baseProfileEntity) = Success;

  const factory GetProfileState.error(NetworkExceptions networkExceptions) =
      Error;}

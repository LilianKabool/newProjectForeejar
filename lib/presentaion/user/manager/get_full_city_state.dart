part of 'get_full_city_cubit.dart';

@freezed
class GetFullCityState with _$GetFullCityState {
  const factory GetFullCityState.initial() = _Initial;
  const factory GetFullCityState.loading() = Loading;

  const factory GetFullCityState.success(FullCityEntity fullCityEntity) = Success;

  const factory GetFullCityState.error(NetworkExceptions networkExceptions) =
      Error;}

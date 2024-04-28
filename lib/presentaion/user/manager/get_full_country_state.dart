part of 'get_full_country_cubit.dart';

@freezed
class GetFullCountryState with _$GetFullCountryState {
  const factory GetFullCountryState.initial() = _Initial;
  const factory GetFullCountryState.loading() = Loading;

  const factory GetFullCountryState.success(FullCountryEntity fullCountryEntity) = Success;

  const factory GetFullCountryState.error(NetworkExceptions networkExceptions) =
      Error;}

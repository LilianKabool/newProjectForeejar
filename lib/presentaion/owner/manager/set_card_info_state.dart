part of 'set_card_info_cubit.dart';

@freezed
class SetCardInfoState with _$SetCardInfoState {
  const factory SetCardInfoState.initial() = _Initial;
  const factory SetCardInfoState.loading() = Loading;

  const factory SetCardInfoState.success(BaseEntity baseEntity) = Success;

  const factory SetCardInfoState.error(NetworkExceptions networkExceptions) =
      Error;}


part of'change_info_cubit.dart';

@freezed
class ChangeInfoState<T> with _$ChangeInfoState {
  const factory ChangeInfoState.init() = Init<T>;

  const factory ChangeInfoState.changeName() = ChangeName<T>;
  const factory ChangeInfoState.changeCaption() = ChangeCaption<T>;
  const factory ChangeInfoState.changeDate() = ChangeDate<T>;
  const factory ChangeInfoState.changePrice() = ChangePrice<T>;
}

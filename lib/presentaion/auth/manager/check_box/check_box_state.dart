import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_box_state.freezed.dart';

@freezed
class CheckBoxState<T> with _$CheckBoxState {
  const factory CheckBoxState.init() = Init<T>;

  const factory CheckBoxState.changeFirstCheckBox() =
  ChangeFirstCheckBox<T>;
  const factory CheckBoxState.changeSecondCheckBox() =
  ChangeSecondCheckBox<T>;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'drop_down_button_state.freezed.dart';

@freezed
class DropDownButtonState<T> with _$DropDownButtonState {
  const factory DropDownButtonState.init() = Init<T>;

  const factory DropDownButtonState.changeDropDownButton() =
  ChangeDropDownButton<T>;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'visibility_password_state.freezed.dart';

@freezed
class VisibilityPasswordState<T> with _$VisibilityPasswordState {
  const factory VisibilityPasswordState.initial() = Initial<T>;

  const factory VisibilityPasswordState.changevisibilityPassword() =
      ChangevisibilityPassword<T>;
}

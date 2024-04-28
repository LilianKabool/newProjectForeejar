
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_state.freezed.dart';

@freezed
class ForgetPasswordState<T> with _$ForgetPasswordState{
  const factory ForgetPasswordState.idel() = Idel<T>;

  const factory ForgetPasswordState.loading() = Loading<T>;

  const factory ForgetPasswordState.success(T data) = Success<T>;

  const factory ForgetPasswordState.error( networkExceptions) = Error<T>;


}



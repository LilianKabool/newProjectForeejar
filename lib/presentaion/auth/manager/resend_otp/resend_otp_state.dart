
import 'package:freezed_annotation/freezed_annotation.dart';



part 'resend_otp_state.freezed.dart';

@freezed
class ResendOtpState<T> with _$ResendOtpState {
  const factory ResendOtpState.idel() = Idel<T>;

  const factory ResendOtpState.loading() = Loading<T>;

  const factory ResendOtpState.success(T data) = Success<T>;

  const factory ResendOtpState.error( networkExceptions) = Error<T>;


}



import 'package:bloc/bloc.dart';
import 'package:untitled/presentaion/auth/manager/resend_otp/resend_otp_state.dart';


import '../../../../core/params/resend_otp_params.dart';

import 'package:injectable/injectable.dart';

import '../../../../feature/auth/repository/auth_repository.dart';

@injectable
class ResendOtpCubit extends Cubit<ResendOtpState> {
  final AuthBaseRepository _authBaseRepository;

  ResendOtpCubit(this._authBaseRepository) : super(ResendOtpState.idel());

  emitResendOtp({
    required String email,
  }) async {
    emit(const ResendOtpState.loading());
    final response = await _authBaseRepository.resendOtp(ResendOtpParams(
      email: email,
    ));
    response.fold((l) => emit(ResendOtpState.error(l)),
        (r) => emit(ResendOtpState.success(r)));
  }
}

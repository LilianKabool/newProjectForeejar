import 'package:bloc/bloc.dart';
import 'package:untitled/core/params/reset_password_params.dart';
import 'package:untitled/presentaion/auth/manager/reset_password/reset_password_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../feature/auth/repository/auth_repository.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthBaseRepository _authBaseRepository;

  ResetPasswordCubit(this._authBaseRepository)
      : super(ResetPasswordState.idel());

  emitResetOtp({
    required String otp,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(const ResetPasswordState.loading());
    final response = await _authBaseRepository.resetPassword(ResetPasswordParams(
      otp: otp, password: password, passwordConfirmation: passwordConfirmation,
    ));
    response.fold((l) => emit(ResetPasswordState.error(l)),
            (r) => emit(ResetPasswordState.success(r)));
  }
}

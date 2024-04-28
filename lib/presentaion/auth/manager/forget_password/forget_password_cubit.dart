

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/forget_password_params.dart';
import '../../../../feature/auth/repository/auth_repository.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final AuthBaseRepository _userBaseRepository;

  ForgetPasswordCubit(this._userBaseRepository)
      : super( ForgetPasswordState.idel()  );

  emitForgetPassword({required String email}) async {
    emit(const ForgetPasswordState.loading());
    final response = await _userBaseRepository.forgetPassword(ForgetPasswordParams(email:  email));
    response.fold((l) => emit(ForgetPasswordState.error(l)),
            (r) => emit(ForgetPasswordState.success(r)));
  }
}
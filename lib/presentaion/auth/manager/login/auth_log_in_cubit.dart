import 'package:bloc/bloc.dart';
import 'package:untitled/core/params/Login_params.dart';
import 'package:untitled/presentaion/auth/manager/login/auth_log_in_state.dart';

import 'package:injectable/injectable.dart';

import '../../../../feature/auth/repository/auth_repository.dart';

@injectable
class UserLogInCubit extends Cubit<UserLogInState> {
  final AuthBaseRepository _authBaseRepository;

  UserLogInCubit(this._authBaseRepository)
      : super(const UserLogInState.initial());

  emitLogInUser({required String email, required String password}) async {
    emit(const UserLogInState.loading());
    final response = await _authBaseRepository
        .login(LoginParams(email: email, password: password));
    response.fold((l) => emit(UserLogInState.error(l)),
        (r) => emit(UserLogInState.success(r)));
  }
}

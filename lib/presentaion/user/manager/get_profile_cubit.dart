import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../feature/user/entity/profile_entity.dart';
import '../../../feature/user/repository/user_repository.dart';
import '../../../network_exceptions.dart';

part 'get_profile_state.dart';
part 'get_profile_cubit.freezed.dart';
@injectable
class GetProfileCubit extends Cubit<GetProfileState> {
final UserBaseRepository _userBaseRepository;
  GetProfileCubit(this._userBaseRepository) : super(const GetProfileState.loading());
  Future<void> emitgetProfile()async{
    emit(const GetProfileState.loading());
    final response = await _userBaseRepository.getProfile();
    response.fold((l) => emit(GetProfileState.error(l)), (r) => emit(GetProfileState.success(r)));
  }}

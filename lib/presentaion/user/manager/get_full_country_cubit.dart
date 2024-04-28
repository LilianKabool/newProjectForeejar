import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/params/get_full_country_params.dart';
import '../../../feature/user/entity/full_country_entity.dart';
import '../../../feature/user/repository/user_repository.dart';
import '../../../network_exceptions.dart';

part 'get_full_country_state.dart';
part 'get_full_country_cubit.freezed.dart';
@injectable
class GetFullCountryCubit extends Cubit<GetFullCountryState> {
final UserBaseRepository _userBaseRepository;
  GetFullCountryCubit(this._userBaseRepository) : super(const GetFullCountryState.initial());
  Future<void> emitgetFullCountries({required GetFullCountryParams getFullCountryParams})async{
    emit(const GetFullCountryState.loading());
    final response = await _userBaseRepository.getFullCountry(getFullCountryParams);
    response.fold((l) => emit(GetFullCountryState.error(l)), (r) => emit(GetFullCountryState.success(r)));
  }}

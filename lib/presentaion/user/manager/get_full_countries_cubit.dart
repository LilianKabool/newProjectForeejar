import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../feature/user/entity/get_full_country_entity.dart';
import '../../../feature/user/repository/user_repository.dart';
import '../../../network_exceptions.dart';

part 'get_full_countries_state.dart';
part 'get_full_countries_cubit.freezed.dart';
@injectable
class GetFullCountriesCubit extends Cubit<GetFullCountriesState> {
final UserBaseRepository _userBaseRepository;
  GetFullCountriesCubit(this._userBaseRepository) : super(const GetFullCountriesState.loading());
  Future<void> emitgetFullCountries()async{
    emit(const GetFullCountriesState.loading());
    final response = await _userBaseRepository.getFullCountries();
    response.fold((l) => emit(GetFullCountriesState.error(l)), (r) => emit(GetFullCountriesState.success(r)));
  }}

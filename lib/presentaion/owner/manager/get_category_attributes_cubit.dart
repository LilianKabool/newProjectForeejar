import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../core/params/get_category_attribute_params.dart';
import '../../../feature/owner/entity/get_category_attribute_entity.dart';
import '../../../feature/owner/repository/owner_respository.dart';
import '../../../network_exceptions.dart';

part 'get_category_attributes_state.dart';
part 'get_category_attributes_cubit.freezed.dart';
@injectable
class GetCategoryAttributesCubit extends Cubit<GetCategoryAttributesState> {
final OwnerBaseRepository _ownerBaseRepository;
  GetCategoryAttributesCubit(this._ownerBaseRepository) : super(const GetCategoryAttributesState.initial());
  Future<void> emitGetCategoryAttribute({required GetCategoryAttributeParams getCategoryAttributeParams})async{
    emit(const GetCategoryAttributesState.loading());
    final response = await _ownerBaseRepository.getCategoryAttribute(getCategoryAttributeParams);
    response.fold((l) => emit(GetCategoryAttributesState.error(l)), (r) => emit(GetCategoryAttributesState.success(r)));
  }}

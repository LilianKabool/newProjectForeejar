
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_consumer.dart';
import '../../../core/constant/end_points.dart';
import '../../../core/params/add_photo_to_product_params.dart';
import '../../../core/params/get_full_city_params.dart';
import '../../../core/params/get_full_country_params.dart';
import '../../../core/params/search_product_params.dart';
import '../../../core/params/show_product_photo_params.dart';
import '../../owner/entity/base_entity.dart';
import '../entity/display_Ads_entity.dart';
import '../entity/fillter_product_by_nbOrders_entity.dart';
import '../entity/full_city_entity.dart';
import '../entity/full_country_entity.dart';
import '../entity/get_full_country_entity.dart';
import '../entity/get_full_currencies_entity.dart';
import '../entity/profile_entity.dart';
import '../entity/search_product_entity.dart';
import '../entity/show_all_category_entity.dart';
import '../entity/show_product_photo_entity.dart';

abstract class UserBaseWebServices {
  Future<DisplayAdsEntity> displayAds();

  Future<FillterProductByNbOrdersEntity> fillterProductByNbOrders();

  Future<ShowAllCategoryEntity> showAllCategory();

  Future<ShowProductPhotoEntity> showProductPhoto(
      ShowProductPhotoParams showProductPhotoParams);

  Future<SearchProductEntity> searchProduct(
      SearchProductParams searchProductParams);
  Future<GetFullCountriesEntity> getFullCountries();
  Future<GetFullCurrenciesEntity> getFullCurrencies();
  Future<FullCountryEntity> getFullCountry(GetFullCountryParams getFullCountryParams);
  Future<FullCityEntity> getFullCity(GetFullCityParams getFullCityParams);
  Future<BaseProfileEntity> getProfile();
}

@Singleton(as: UserBaseWebServices)
class UserWebServicesImpl implements UserBaseWebServices {
  final ApiConsumer _apiConsumer;

  UserWebServicesImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<DisplayAdsEntity> displayAds() async {
    final response = await _apiConsumer.get(
      EndPoints.displayAds,
    );
    return DisplayAdsEntity.fromJson(response);
  }

  @override
  Future<FillterProductByNbOrdersEntity> fillterProductByNbOrders() async {
    final response = await _apiConsumer.get(
      EndPoints.filterProductByNbOrders,
    );
    return FillterProductByNbOrdersEntity.fromJson(response);
  }

  @override
  Future<ShowAllCategoryEntity> showAllCategory() async {
    final response = await _apiConsumer.get(
      EndPoints.showAllCategory,
    );
    return ShowAllCategoryEntity.fromJson(response);
  }

  @override
  Future<ShowProductPhotoEntity> showProductPhoto(
      ShowProductPhotoParams showProductPhotoParams) async {
    final response = await _apiConsumer.get(EndPoints.showProductPhoto,
        queryParameters: showProductPhotoParams.toJson());
    return ShowProductPhotoEntity.fromJson(response);
  }

  @override
  Future<SearchProductEntity> searchProduct(
      SearchProductParams searchProductParams  ) async {
    final response = await _apiConsumer.get(
      EndPoints.searchProduct,
      queryParameters: searchProductParams.toJson(),
    );
    return SearchProductEntity.fromJson(response);
  }

  @override
  Future<GetFullCountriesEntity> getFullCountries() async{
    final response = await _apiConsumer.get(EndPoints.getFullCountries);
    return GetFullCountriesEntity.fromJson(response);
  }

  @override
  Future<GetFullCurrenciesEntity> getFullCurrencies()async {
    final response = await _apiConsumer.get(EndPoints.getFullCurrencies);
    return GetFullCurrenciesEntity.fromJson(response);
  }

  @override
  Future<FullCountryEntity> getFullCountry(GetFullCountryParams getFullCountryParams) async{
    final response = await _apiConsumer.post(EndPoints.getFullCountry,queryParameters: getFullCountryParams.toJson());
    return FullCountryEntity.fromJson(response);
  }

  @override
  Future<FullCityEntity> getFullCity(GetFullCityParams getFullCityParams) async{
    final response = await _apiConsumer.post(EndPoints.getFullCountry,queryParameters: getFullCityParams.toJson());
    return FullCityEntity.fromJson(response);
  }
  Future<FormData> formAddphoto(AddPhotoToProductParams addPhotoToProductParams) async {
    final formData = FormData.fromMap({
      'path': await MultipartFile.fromFile(addPhotoToProductParams.photo.path),
    });

    return formData;
  }

  @override
  Future<BaseEntity> addPhotoToProduct(AddPhotoToProductParams addPhotoToProductParams) async{
    final formData = await formAddphoto(addPhotoToProductParams);

    final response = await _apiConsumer.post(
      EndPoints.addPhotoToProduct,
      body: formData,
    );

    return BaseEntity.fromJson(response);

  }
  @override
  Future<BaseProfileEntity> getProfile() async{
    final response = await _apiConsumer.get(EndPoints.getProfile);
    return BaseProfileEntity.fromJson(response);
  }
}

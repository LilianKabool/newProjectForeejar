

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/network/network_info.dart';
import '../../../core/params/get_full_city_params.dart';
import '../../../core/params/get_full_country_params.dart';
import '../../../core/params/search_product_params.dart';
import '../../../core/params/show_product_photo_params.dart';
import '../../../network_exceptions.dart';
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
import '../web_service/user_web_service.dart';


abstract class UserBaseRepository{
  Future<Either<NetworkExceptions, DisplayAdsEntity>> displayAds();
  Future<Either<NetworkExceptions, FillterProductByNbOrdersEntity>> fillterProductByNbOrders();
  Future<Either<NetworkExceptions, ShowAllCategoryEntity>> showAllCategory();
  Future<Either<NetworkExceptions, ShowProductPhotoEntity>> showProductPhoto(ShowProductPhotoParams showProductPhotoParams);
  Future<Either<NetworkExceptions, SearchProductEntity>> searchProduct(SearchProductParams searchProductParams);
  Future<Either<NetworkExceptions,GetFullCountriesEntity>> getFullCountries();
  Future<Either<NetworkExceptions,GetFullCurrenciesEntity>> getFullCurrencies();
  Future<Either<NetworkExceptions,FullCountryEntity>> getFullCountry(GetFullCountryParams getFullCountryParams);
  Future<Either<NetworkExceptions,FullCityEntity>> getFullCity(GetFullCityParams getFullCityParams);
  Future<Either<NetworkExceptions,BaseProfileEntity>> getProfile();

}
@Singleton(as: UserBaseRepository)
class UserRepositoryImpl implements UserBaseRepository{
  final UserBaseWebServices _userBaseWebServices;
  final NetworkInfo _networkInfo;

  UserRepositoryImpl({required UserBaseWebServices userBaseWebServices, required NetworkInfo networkInfo}) : _userBaseWebServices = userBaseWebServices, _networkInfo = networkInfo;



  @override
  Future<Either<NetworkExceptions,DisplayAdsEntity >> displayAds() async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _userBaseWebServices.displayAds();
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }
  @override
  Future<Either<NetworkExceptions,FillterProductByNbOrdersEntity >> fillterProductByNbOrders() async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _userBaseWebServices.fillterProductByNbOrders();
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }
@override
  Future<Either<NetworkExceptions,ShowAllCategoryEntity >> showAllCategory() async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _userBaseWebServices.showAllCategory();
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

@override
  Future<Either<NetworkExceptions,ShowProductPhotoEntity >> showProductPhoto(ShowProductPhotoParams showProductPhotoParams) async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _userBaseWebServices.showProductPhoto(showProductPhotoParams);
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }
@override
  Future<Either<NetworkExceptions,SearchProductEntity >> searchProduct(SearchProductParams searchProductParams) async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _userBaseWebServices.searchProduct(searchProductParams);
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, GetFullCountriesEntity>> getFullCountries() async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _userBaseWebServices.getFullCountries();
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, GetFullCurrenciesEntity>> getFullCurrencies() async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _userBaseWebServices.getFullCurrencies();
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, FullCountryEntity>> getFullCountry(GetFullCountryParams getFullCountryParams)async {
    try{
      if(await _networkInfo.isConnected){
        final response = await _userBaseWebServices.getFullCountry(getFullCountryParams);
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, FullCityEntity>> getFullCity(GetFullCityParams getFullCityParams) async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _userBaseWebServices.getFullCity(getFullCityParams);
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }
  @override
  Future<Either<NetworkExceptions, BaseProfileEntity>> getProfile() async{
    try{
      if(await _networkInfo.isConnected){
        final response = await _userBaseWebServices.getProfile();
        return Right(response);
      }else{
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex){
      return Left(NetworkExceptions.getDioException(ex));
    }
  }
}
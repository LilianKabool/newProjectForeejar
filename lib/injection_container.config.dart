// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i7;

import 'core/api/api_consumer.dart' as _i10;
import 'core/api/dio_consumer.dart' as _i6;
import 'core/api/logging_interceptor.dart' as _i8;
import 'core/network/network_info.dart' as _i9;
import 'core/third_party_injection.dart' as _i42;
import 'feature/auth/repository/auth_repository.dart' as _i15;
import 'feature/auth/web_services/auth_web_services.dart' as _i11;
import 'feature/order_user/repository/order_repository.dart' as _i17;
import 'feature/order_user/web_service/order_web_service.dart' as _i12;
import 'feature/owner/repository/owner_respository.dart' as _i18;
import 'feature/owner/web_services/owner_web_services.dart' as _i13;
import 'feature/user/repository/user_repository.dart' as _i29;
import 'feature/user/web_service/user_web_service.dart' as _i14;
import 'presentaion/auth/manager/check_box/check_box_cubit.dart' as _i4;
import 'presentaion/auth/manager/forget_password/forget_password_cubit.dart'
    as _i16;
import 'presentaion/auth/manager/login/auth_log_in_cubit.dart' as _i30;
import 'presentaion/auth/manager/register/register_cubit.dart' as _i21;
import 'presentaion/auth/manager/resend_otp/resend_otp_cubit.dart' as _i22;
import 'presentaion/auth/manager/reset_password/reset_password_cubit.dart'
    as _i23;
import 'presentaion/auth/manager/verify_code/verifiy_code_cubit.dart' as _i31;
import 'presentaion/order_user/manager/cubit/rate_product_cubit.dart' as _i20;
import 'presentaion/order_user/manager/store_order_cubit.dart' as _i25;
import 'presentaion/owner/manager/active_subscription_cubit.dart' as _i32;
import 'presentaion/owner/manager/add_photo_to_product_cubit.dart' as _i33;
import 'presentaion/owner/manager/edit_info_for_product/change_info_cubit.dart'
    as _i3;
import 'presentaion/owner/manager/get_category_attributes_cubit.dart' as _i34;
import 'presentaion/owner/manager/my_products_cubit.dart' as _i40;
import 'presentaion/owner/manager/my_subscription_cubit.dart' as _i41;
import 'presentaion/owner/manager/processing_orders_cubit.dart' as _i19;
import 'presentaion/owner/manager/set_card_info_cubit.dart' as _i24;
import 'presentaion/owner/manager/subscripe_cubit.dart' as _i26;
import 'presentaion/owner/manager/subscription_cubit.dart' as _i27;
import 'presentaion/owner/manager/update_product_cubit.dart' as _i28;
import 'presentaion/user/manager/get_full_city_cubit.dart' as _i35;
import 'presentaion/user/manager/get_full_countries_cubit.dart' as _i36;
import 'presentaion/user/manager/get_full_country_cubit.dart' as _i37;
import 'presentaion/user/manager/get_full_currencies_cubit.dart' as _i38;
import 'presentaion/user/manager/get_profile_cubit.dart' as _i39;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyInjection = _$ThirdPartyInjection();
    gh.factory<_i3.ChangeInfoCubit>(() => _i3.ChangeInfoCubit());
    gh.factory<_i4.CheckBoxCubit>(() => _i4.CheckBoxCubit());
    gh.singleton<_i5.Dio>(() => thirdPartyInjection.dio);
    gh.singleton<_i6.ErrorInterceptor>(() => _i6.ErrorInterceptor());
    gh.singleton<_i7.InternetConnectionChecker>(
        () => thirdPartyInjection.internetConnectionChecker);
    gh.singleton<_i8.LoggingInterceptor>(() => _i8.LoggingInterceptor());
    gh.lazySingleton<_i9.NetworkInfo>(() => _i9.NetworkInfoImpl(
        connectionChecker: gh<_i7.InternetConnectionChecker>()));
    gh.singleton<_i10.ApiConsumer>(() => _i6.DioConsumer(gh<_i5.Dio>()));
    gh.singleton<_i11.AuthBaseWebServices>(
        () => _i11.AuthWebServicesImpl(apiConsumer: gh<_i10.ApiConsumer>()));
    gh.singleton<_i12.OrderBaseWebServices>(
        () => _i12.OrderWebServicesImpl(apiConsumer: gh<_i10.ApiConsumer>()));
    gh.singleton<_i13.OwnerBaseWebServices>(
        () => _i13.OwnerWebServicesImpl(apiConsumer: gh<_i10.ApiConsumer>()));
    gh.singleton<_i14.UserBaseWebServices>(
        () => _i14.UserWebServicesImpl(apiConsumer: gh<_i10.ApiConsumer>()));
    gh.singleton<_i15.AuthBaseRepository>(() => _i15.AuthRepositoryImpl(
          authBaseWebServices: gh<_i11.AuthBaseWebServices>(),
          networkInfo: gh<_i9.NetworkInfo>(),
        ));
    gh.factory<_i16.ForgetPasswordCubit>(
        () => _i16.ForgetPasswordCubit(gh<_i15.AuthBaseRepository>()));
    gh.singleton<_i17.OrderBaseRepository>(() => _i17.OrderRepositoryImpl(
          networkInfo: gh<_i9.NetworkInfo>(),
          orderBaseWebServices: gh<_i12.OrderBaseWebServices>(),
        ));
    gh.singleton<_i18.OwnerBaseRepository>(() => _i18.OwnerRepositoryImpl(
          ownerBaseWebServices: gh<_i13.OwnerBaseWebServices>(),
          networkInfo: gh<_i9.NetworkInfo>(),
        ));
    gh.factory<_i19.ProcessingOrdersCubit>(
        () => _i19.ProcessingOrdersCubit(gh<_i18.OwnerBaseRepository>()));
    gh.factory<_i20.RateProductCubit>(
        () => _i20.RateProductCubit(gh<_i17.OrderBaseRepository>()));
    gh.factory<_i21.RegisterCubit>(
        () => _i21.RegisterCubit(gh<_i15.AuthBaseRepository>()));
    gh.factory<_i22.ResendOtpCubit>(
        () => _i22.ResendOtpCubit(gh<_i15.AuthBaseRepository>()));
    gh.factory<_i23.ResetPasswordCubit>(
        () => _i23.ResetPasswordCubit(gh<_i15.AuthBaseRepository>()));
    gh.factory<_i24.SetCardInfoCubit>(
        () => _i24.SetCardInfoCubit(gh<_i18.OwnerBaseRepository>()));
    gh.factory<_i25.StoreOrderCubit>(
        () => _i25.StoreOrderCubit(gh<_i17.OrderBaseRepository>()));
    gh.factory<_i26.SubscripeCubit>(
        () => _i26.SubscripeCubit(gh<_i18.OwnerBaseRepository>()));
    gh.factory<_i27.SubscriptionCubit>(
        () => _i27.SubscriptionCubit(gh<_i18.OwnerBaseRepository>()));
    gh.factory<_i28.UpdateProductCubit>(
        () => _i28.UpdateProductCubit(gh<_i18.OwnerBaseRepository>()));
    gh.singleton<_i29.UserBaseRepository>(() => _i29.UserRepositoryImpl(
          userBaseWebServices: gh<_i14.UserBaseWebServices>(),
          networkInfo: gh<_i9.NetworkInfo>(),
        ));
    gh.factory<_i30.UserLogInCubit>(
        () => _i30.UserLogInCubit(gh<_i15.AuthBaseRepository>()));
    gh.factory<_i31.VerifiyCodeCubit>(
        () => _i31.VerifiyCodeCubit(gh<_i15.AuthBaseRepository>()));
    gh.factory<_i32.ActiveSubscriptionCubit>(
        () => _i32.ActiveSubscriptionCubit(gh<_i18.OwnerBaseRepository>()));
    gh.factory<_i33.AddPhotoToProductCubit>(
        () => _i33.AddPhotoToProductCubit(gh<_i18.OwnerBaseRepository>()));
    gh.factory<_i34.GetCategoryAttributesCubit>(
        () => _i34.GetCategoryAttributesCubit(gh<_i18.OwnerBaseRepository>()));
    gh.factory<_i35.GetFullCityCubit>(
        () => _i35.GetFullCityCubit(gh<_i29.UserBaseRepository>()));
    gh.factory<_i36.GetFullCountriesCubit>(
        () => _i36.GetFullCountriesCubit(gh<_i29.UserBaseRepository>()));
    gh.factory<_i37.GetFullCountryCubit>(
        () => _i37.GetFullCountryCubit(gh<_i29.UserBaseRepository>()));
    gh.factory<_i38.GetFullCurrenciesCubit>(
        () => _i38.GetFullCurrenciesCubit(gh<_i29.UserBaseRepository>()));
    gh.factory<_i39.GetProfileCubit>(
        () => _i39.GetProfileCubit(gh<_i29.UserBaseRepository>()));
    gh.factory<_i40.MyProductsCubit>(
        () => _i40.MyProductsCubit(gh<_i18.OwnerBaseRepository>()));
    gh.factory<_i41.MySubscriptionCubit>(
        () => _i41.MySubscriptionCubit(gh<_i18.OwnerBaseRepository>()));
    return this;
  }
}

class _$ThirdPartyInjection extends _i42.ThirdPartyInjection {}

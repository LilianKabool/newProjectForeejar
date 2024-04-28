import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import '../../../core/api/api_consumer.dart';
import '../../../core/constant/end_points.dart';
import '../../../core/network/network_info.dart';
import '../../../core/params/Login_params.dart';
import '../../../core/params/forget_password_params.dart';
import '../../../core/params/register_params.dart';
import '../../../core/params/resend_otp_params.dart';
import '../../../core/params/reset_password_params.dart';
import '../../../core/params/verify_otp_params.dart';
import '../../../network_exceptions.dart';
import '../entity/forget_password/forget_password_entity.dart';
import '../entity/login/login_entity.dart';
import '../entity/register/register_entity.dart';
import '../entity/resend_otp/resend_otp_entity.dart';
import '../entity/reset_password/reset_password_entity.dart';
import '../entity/verify_otp/verify_otp_entity.dart';
import '../web_services/auth_web_services.dart';

import 'package:injectable/injectable.dart';

abstract class AuthBaseWebServices {
  Future<LoginEntity> login(LoginParams loginParams);

  Future<RegisterEntity> register(RegisterParams registerParams);

  Future<ForgetPasswordEntity> forgetPassword(
      ForgetPasswordParams forgetPasswordParams);

  Future<ResetPasswordEntity> resetPassword(
      ResetPasswordParams resetPasswordParams);

  Future<ResendOtpEntity> resendOtp(ResendOtpParams resendOtpParams);

  Future<VerifyOtpEntity> verifyOtp(VerifyOtpParams verifyOtpParams);
}

@Singleton(as: AuthBaseWebServices)
class AuthWebServicesImpl implements AuthBaseWebServices {
  final ApiConsumer _apiConsumer;

  AuthWebServicesImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<LoginEntity> login(LoginParams loginParams) async {
    final response = await _apiConsumer.post(EndPoints.login,
        queryParameters: loginParams.toJson());
    return LoginEntity.fromJson(response);
  }

  @override
  Future<RegisterEntity> register(RegisterParams registerParams) async {
    final response = await _apiConsumer.post(EndPoints.register,
        queryParameters: registerParams.toJson());
    return RegisterEntity.fromJson(response);
  }

  @override
  Future<VerifyOtpEntity> verifyOtp(VerifyOtpParams verifyOtpParams) async {
    final response = await _apiConsumer.post(EndPoints.verifyOtp,
        queryParameters: verifyOtpParams.toJson());
    return VerifyOtpEntity.fromJson(response);
  }

  @override
  Future<ForgetPasswordEntity> forgetPassword(
      ForgetPasswordParams forgetPasswordParams) async {
    final response = await _apiConsumer.post(EndPoints.forgetPassword,
        queryParameters: forgetPasswordParams.toJson());
    return ForgetPasswordEntity.fromJson(response);
  }

  @override
  Future<ResendOtpEntity> resendOtp(ResendOtpParams resendOtpParams) async {
    final response = await _apiConsumer.post(EndPoints.resendotp,
        queryParameters: resendOtpParams.toJson());
    return ResendOtpEntity.fromJson(response);
  }

  @override
  Future<ResetPasswordEntity> resetPassword(
      ResetPasswordParams resetPasswordParams) async {
    final response = await _apiConsumer.post(EndPoints.resetPassword,
        queryParameters: resetPasswordParams.toJson());
    return ResetPasswordEntity.fromJson(response);
  }
}

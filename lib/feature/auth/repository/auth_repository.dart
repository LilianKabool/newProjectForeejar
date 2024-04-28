import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
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

abstract class AuthBaseRepository {
  Future<Either<NetworkExceptions, LoginEntity>> login(LoginParams loginParams);

  Future<Either<NetworkExceptions, RegisterEntity>> register(
      RegisterParams registerParams);

  Future<Either<NetworkExceptions, ForgetPasswordEntity>> forgetPassword(
      ForgetPasswordParams forgetPasswordParams);

  Future<Either<NetworkExceptions, VerifyOtpEntity>> verifyOtp(
      VerifyOtpParams forgetotpParams);

  Future<Either<NetworkExceptions, ResendOtpEntity>> resendOtp(
      ResendOtpParams resendOtpParams);

  Future<Either<NetworkExceptions, ResetPasswordEntity>> resetPassword(
      ResetPasswordParams resetPasswordParams);
}

@Singleton(as: AuthBaseRepository)
class AuthRepositoryImpl implements AuthBaseRepository {
  final AuthBaseWebServices _authBaseWebServices;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl(
      {required AuthBaseWebServices authBaseWebServices,
      required NetworkInfo networkInfo})
      : _authBaseWebServices = authBaseWebServices,
        _networkInfo = networkInfo;

  @override
  Future<Either<NetworkExceptions, LoginEntity>> login(
      LoginParams loginParams) async {
    try {
      if (await _networkInfo.isConnected) {
        final response = await _authBaseWebServices.login(loginParams);
        return Right(response);
      } else {
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, RegisterEntity>> register(
      RegisterParams registerParams) async {
    try {
      if (await _networkInfo.isConnected) {
        final response = await _authBaseWebServices.register(registerParams);
        return Right(response);
      } else {
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

  @override
  Future<Either<NetworkExceptions, ForgetPasswordEntity>> forgetPassword(
      ForgetPasswordParams forgetPasswordParams) async {
    try {
      if (await _networkInfo.isConnected) {
        final response =
            await _authBaseWebServices.forgetPassword(forgetPasswordParams);
        return Right(response);
      } else {
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getDioException(ex));
    }
  }
  @override
  Future<Either<NetworkExceptions, ResendOtpEntity>> resendOtp(
      ResendOtpParams resendOtpParams) async {
    try {
      if (await _networkInfo.isConnected) {
        final response =
            await _authBaseWebServices.resendOtp(resendOtpParams);
        return Right(response);
      } else {
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getDioException(ex));
    }
  }
  @override
  Future<Either<NetworkExceptions, ResetPasswordEntity>> resetPassword(
      ResetPasswordParams resetPasswordParams) async {
    try {
      if (await _networkInfo.isConnected) {
        final response =
            await _authBaseWebServices.resetPassword(resetPasswordParams);
        return Right(response);
      } else {
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getDioException(ex));
    }
  }
  @override
  Future<Either<NetworkExceptions, VerifyOtpEntity>> verifyOtp(
      VerifyOtpParams verifyOtpParams) async {
    try {
      if (await _networkInfo.isConnected) {
        final response =
            await _authBaseWebServices.verifyOtp(verifyOtpParams);
        return Right(response);
      } else {
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } on Exception catch (ex) {
      return Left(NetworkExceptions.getDioException(ex));
    }
  }

}

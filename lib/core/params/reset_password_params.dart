class ResetPasswordParams {
  final String otp;
  final String password;
  final String passwordConfirmation;

  ResetPasswordParams({
    required this.otp,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "password": password,
        "password_confirmation": passwordConfirmation,
      };
}

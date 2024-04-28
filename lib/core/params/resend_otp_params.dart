class ResendOtpParams {
  final String email;


  ResendOtpParams({required this.email,});

  Map<String, dynamic> toJson() =>
      {
        "email": email,
      };
}
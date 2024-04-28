class VerifyOtpParams{
  final  otp;

  VerifyOtpParams({required this.otp, });

  Map<String,dynamic> toJson()=>{
    "otp":otp ,

  };
}
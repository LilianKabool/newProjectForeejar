import 'package:freezed_annotation/freezed_annotation.dart';
part 'resend_otp_entity.g.dart';
@JsonSerializable()
class ResendOtpEntity{
  String message;
  ResendOtpEntity({
    required this.message,

  });
  factory ResendOtpEntity.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ResendOtpEntityToJson(this);
}

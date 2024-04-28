

import '../../../components.dart';
import '../../../core/constant/colors.dart';import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget languageText(){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      text(
        textData: 'language :',
        color: AppColors.pureBlack,
        fontSize: 16.sp,
      ),
      SizedBox(
        width: 10.0.w,
      ),
      text(
        textData: 'English',
        color: AppColors.mediumGolden1,
        fontSize: 16.sp,
      ),
    ],
  );
}
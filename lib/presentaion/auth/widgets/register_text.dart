
import 'package:untitled/presentaion/auth/widgets/signup_textButton.dart';

import '../../../components.dart';
import '../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget registerText(context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      text(
        textData: 'Not Register ?',
        color: AppColors.pureBlack,
        fontSize: 16.sp,
      ),
      SizedBox(
        width: 10.0.w,
      ),
      signUpTextButton(context),
    ],
  ) ;
}
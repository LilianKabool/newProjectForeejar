import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget imageWidget() {
  return Image(
    width: 600.w,
    height: 230.0,
    image:  const AssetImage("assets/images/logo.jpg"),
  );
}

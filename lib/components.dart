import 'package:flutter/material.dart';

Widget text({
  required String textData,
  String fontFamily =  'BAHNSCHRIF',
  Color? color,
  FontStyle? fontStyle,
  Color? backgroundColor,
  double ? fontSize,
  FontWeight? fontWeight,
  TextBaseline? textBaseline,
  int? maxLines,
  TextOverflow? textOverflow,
  TextAlign? textAlign,
}) {
  return Text(
    textData,
    style: TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontStyle: fontStyle,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      textBaseline: textBaseline,
    ),
    maxLines: maxLines,
    overflow: textOverflow,
    textAlign: textAlign,
  );
}


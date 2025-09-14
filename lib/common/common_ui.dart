import 'package:a2finance/common/app_colors.dart';
import 'package:a2finance/common/app_fonts.dart';
import 'package:flutter/material.dart';

class CommonUi {
  /// Custom Text Style
  static TextStyle? customTextStyle({
    Color? color,
    double fontSize = 14,
    String fontFamily = AppFonts.regular,
  }) {
    return TextStyle(fontFamily: fontFamily, color: color, fontSize: fontSize);
  }



  /// Returns a customizable loading spinner widget.
  static Widget loadinIndicator({
    double height = 25,
    double width = 25,
    double strokeWidth = 2,
    Color color = AppColors.white,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: CircularProgressIndicator(color: color, strokeWidth: strokeWidth),
    );
  }


}

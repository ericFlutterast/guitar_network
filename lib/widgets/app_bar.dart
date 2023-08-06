import 'package:flutter/material.dart';
import '../services/app_colors.dart';

abstract class ReturnAppBar {
  static PreferredSizeWidget returnAppBar(BuildContext context, String text) {
    final appColors = AppColors();
    return AppBar(
      backgroundColor: appColors.mainAppColor,
      title: Text(text),
    );
  }
}

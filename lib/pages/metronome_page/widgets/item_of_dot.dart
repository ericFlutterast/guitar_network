import 'package:flutter/material.dart';

import '../../../services/app_colors.dart';

class ItemOfDotList extends StatelessWidget {
  final bool flag;
  const ItemOfDotList({
    required this.flag,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: flag ? appColors.dimGreenColor : appColors.mainAppColor,
        ),
        height: 30,
        width: 30,
      ),
    );
  }
}

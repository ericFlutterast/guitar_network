import 'package:flutter/material.dart';
import '../../../../services/app_colors.dart';

class SendMessageTextField extends StatelessWidget {
  final TextEditingController controller;

  const SendMessageTextField({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();

    return TextField(
      controller: controller,
      cursorColor: appColors.mainAppColor,
      style: TextStyle(
        color: appColors.mainAppColor,
        fontSize: MediaQuery.of(context).size.width / 26,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 249, 249, 249),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

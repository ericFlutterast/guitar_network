import 'package:flutter/material.dart';

import '../../../services/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool errorFieldFlag;

  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    this.errorFieldFlag = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 50),
        if (errorFieldFlag)
          const Text(
            'Обязательное поле',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: controller,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 45,
              fontWeight: FontWeight.w600,
            ),
            cursorColor: colors.mainAppColor,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: errorFieldFlag ? Colors.red : colors.mainAppColor,
                ),
              ),
              hintText: title,
            ),
          ),
        ),
      ],
    );
  }
}

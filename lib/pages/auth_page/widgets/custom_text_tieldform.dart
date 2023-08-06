import 'package:flutter/material.dart';

import '../../../services/app_colors.dart';

class CustomTextFieldForm extends StatelessWidget {
  final FocusNode focuseNode;
  final IconData iconData;
  final String label;
  final bool obscure;
  final Function(String) getValue;

  const CustomTextFieldForm({
    required this.obscure,
    required this.getValue,
    required this.focuseNode,
    required this.label,
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 15),
      child: TextField(
        style: TextStyle(
          color: colors.mainAppColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        obscureText: obscure,
        onChanged: (value) => getValue(value),
        cursorColor: colors.mainAppColor,
        focusNode: focuseNode,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: colors.mainAppColor,
              width: 2,
            ),
          ),
          labelText: label,
          labelStyle: TextStyle(
            color: colors.mainAppColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          prefixIcon: Icon(
            iconData,
            color: focuseNode.hasFocus
                ? Colors.white
                : const Color.fromARGB(255, 48, 36, 40),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

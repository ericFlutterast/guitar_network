import 'package:flutter/material.dart';

import '../../../services/app_colors.dart';

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 16),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/registration_page');
        },
        child: Text(
          'Зарегестрироваься',
          style: TextStyle(
            color: appColors.mainAppColor,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

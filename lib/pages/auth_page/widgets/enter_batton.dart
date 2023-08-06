import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../notifier/auth_provider.dart';

class EnterButton extends StatelessWidget {
  const EnterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 22,
        width: MediaQuery.of(context).size.width / 3,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(appColors.mainAppColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          onPressed: () {
            context.read<AuthProvider>().auth();
          },
          child: const Text(
            'Войти',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

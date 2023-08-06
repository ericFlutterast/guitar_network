import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../notifier/tuner_provider.dart';
import '../../../services/app_colors.dart';

class ActivateButton extends StatelessWidget {
  const ActivateButton({
    super.key,
    required this.marginForUnderButton,
    required this.borderRadiusForUnderButton,
    required this.label,
    required this.fontSizeForUnderButton,
  });

  final double marginForUnderButton;
  final double borderRadiusForUnderButton;
  final String label;
  final double fontSizeForUnderButton;

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    return Container(
      margin: EdgeInsets.symmetric(vertical: marginForUnderButton),
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.height / 2.5,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(appColors.mainButtonColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusForUnderButton),
              ),
            )),
        onPressed: () {
          context.read<TunerProvider>().pressButton();
        },
        child: Text(
          label,
          style: TextStyle(
            fontSize: fontSizeForUnderButton,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

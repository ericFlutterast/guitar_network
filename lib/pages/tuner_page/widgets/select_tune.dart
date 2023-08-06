import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../notifier/tuner_provider.dart';
import '../../../services/app_colors.dart';

class SelectTune extends StatelessWidget {
  const SelectTune({
    super.key,
    required this.marginForDroppedDownMenu,
  });

  final double marginForDroppedDownMenu;

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    return Container(
      margin: EdgeInsets.all(marginForDroppedDownMenu),
      height: MediaQuery.of(context).size.height / 15,
      width: double.infinity,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: 'Выбирите строй (Standart E)',
            labelStyle: TextStyle(
              color: appColors.mainAppColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: appColors.mainAppBackgroundColor,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: appColors.mainAppColor,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          items: context
              .read<TunerProvider>()
              .getListOfSelectTune
              .map<DropdownMenuItem<String>>((String element) {
            return DropdownMenuItem<String>(
              value: element,
              child: Text(element),
            );
          }).toList(),
          onChanged: (value) {
            context.read<TunerProvider>().selectTune(value!);
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/dram_machine_provider.dart';
import 'package:provider/provider.dart';

import '../../../services/app_colors.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final drumColors = DrunMachineColors();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Button(
            drumColors: drumColors,
            title: 'Удалить',
            function: context.read<DrumMachineProvider>().deleteItem),
        Button(
            drumColors: drumColors,
            title: 'Добавить',
            function: context.read<DrumMachineProvider>().addItem),
      ],
    );
  }
}

class Button extends StatelessWidget {
  final DrunMachineColors drumColors;
  final String title;
  final Function function;

  const Button({
    super.key,
    required this.title,
    required this.drumColors,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 3,
      height: width / 4,
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: drumColors.mainAppBackgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Colors.amber,
        ),
      ),
      child: TextButton(
        onPressed: () {
          function();
        },
        child: Text(
          title,
          style: TextStyle(
              color: drumColors.mainAppColor,
              fontSize: width / 18,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

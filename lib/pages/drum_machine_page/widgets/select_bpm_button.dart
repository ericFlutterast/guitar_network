import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/dram_machine_provider.dart';
import 'package:provider/provider.dart';

import '../../../services/app_colors.dart';

class SelectBpmButton extends StatelessWidget {
  const SelectBpmButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bpm = context.watch<DrumMachineProvider>().getBpm;
    final drumColors = DrunMachineColors();
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          drumColors.mainAppColor,
        ),
      ),
      onPressed: () {
        context.read<DrumMachineProvider>().selectBpmBatton();
      },
      child: Text(
        '$bpm',
        style:
            TextStyle(fontSize: 20, color: drumColors.mainAppBackgroundColor),
      ),
    );
  }
}

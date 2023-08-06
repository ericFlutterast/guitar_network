import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/dram_machine_provider.dart';
import 'package:provider/provider.dart';

import '../../../services/app_colors.dart';
import 'buttons_item.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).size.height / 30;
    final top = bottom / 2;
    final drumColors = DrunMachineColors();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonsItem(
          color: Colors.red,
          iconData: Icons.pause,
          onPressed: () {
            context.read<DrumMachineProvider>().stop();
          },
        ),
        ButtonsItem(
          color: drumColors.dimGreenColor,
          iconData: Icons.play_arrow,
          onPressed: () {
            context.read<DrumMachineProvider>().play();
          },
        ),
      ],
    );
  }
}

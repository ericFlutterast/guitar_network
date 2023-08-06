import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/dram_machine_provider.dart';
import 'package:provider/provider.dart';

import '../../../services/app_colors.dart';

class Indecator extends StatelessWidget {
  const Indecator({
    super.key,
    required this.height,
    required this.width,
    required this.drumColors,
  });

  final double height;
  final double width;
  final DrunMachineColors drumColors;

  @override
  Widget build(BuildContext context) {
    final indecatorList = context.watch<DrumMachineProvider>().indecatorList;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: indecatorList.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
        height: height / 25,
        width: width / 12.5,
        decoration: BoxDecoration(
          color: indecatorList[index].backgroundFlag
              ? Colors.red
              : drumColors.mainButtonColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

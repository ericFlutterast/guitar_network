import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/dram_machine_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/drum_machine_model.dart';

class TrackItem extends StatelessWidget {
  final bool borderFlag;
  final bool backgroundFlag;
  final bool indecator;
  final Color color;
  final int jIndex;
  final int iIndex;

  const TrackItem({
    required this.borderFlag,
    required this.backgroundFlag,
    required this.color,
    required this.iIndex,
    required this.jIndex,
    required this.indecator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<TouchDrumButtonItem> listOfDrumNames =
        ListTouchDrumButtonItem().getList;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundFlag ? listOfDrumNames[iIndex].color : color,
            border: borderFlag
                ? Border.all(width: 2, color: Colors.pink)
                : Border.all(),
          ),
          width: MediaQuery.of(context).size.width / 9.79,
          child: InkWell(
            onTap: () {
              context
                  .read<DrumMachineProvider>()
                  .selectPosition(iIndex, jIndex);
            },
          ),
        ),
        if (indecator)
          Container(
            color: const Color.fromARGB(61, 219, 219, 219),
            width: MediaQuery.of(context).size.width / 9.79,
          ),
      ],
    );
  }
}

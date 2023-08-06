import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/dram_machine_provider.dart';
import 'package:guitar_network_vkr/pages/drum_machine_page/widgets/title_of_drum.dart';
import 'package:provider/provider.dart';

import '../../../models/drum_machine_model.dart';
import 'track.dart';

class MatrixWidge extends StatelessWidget {
  final double height;
  const MatrixWidge({
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const borderSide = BorderSide(
      width: 2,
      color: Colors.amber,
    );

    final List<TouchDrumButtonItem> drumList =
        ListTouchDrumButtonItem().getList;

    final matrix = context.watch<DrumMachineProvider>().matrix;

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: borderSide,
        ),
      ),
      height: height / 1.8,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: drumList.length,
              itemBuilder: (context, index) => TitleOfDrum(
                color: drumList[index].color,
                title: drumList[index].name,
              ),
            ),
          ),
          //Column
          Expanded(
            flex: 9,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: matrix.length,
              itemBuilder: (context, index) => Track(
                trackList: matrix[index].trackList,
              ),
            ),
          )
        ],
      ),
    );
  }
}

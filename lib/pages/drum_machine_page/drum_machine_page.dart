import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/dram_machine_provider.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';
import 'package:guitar_network_vkr/widgets/app_bar.dart';
import 'package:guitar_network_vkr/widgets/drawer.dart';
import 'package:provider/provider.dart';

import 'widgets/buttons.dart';
import 'widgets/control_buttons.dart';
import 'widgets/Indecator.dart';
import 'widgets/matrix_widget.dart';
import 'widgets/select_bpm_button.dart';

class DrumMachinePage extends StatelessWidget {
  const DrumMachinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final stackList = context.watch<DrumMachineProvider>().getStackList;
    return Stack(
      children: stackList,
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.titleOfAppBar,
  });

  final String titleOfAppBar;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final drumColors = DrunMachineColors();

    return Scaffold(
      appBar: ReturnAppBar.returnAppBar(context, titleOfAppBar),
      backgroundColor: Colors.black,
      drawer: const MainDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: height / 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SelectBpmButton(),
                Indecator(
                  height: height,
                  width: width,
                  drumColors: drumColors,
                )
              ],
            ),
          ),
          MatrixWidge(height: height),
          const ControlButtons(),
          const Buttons(),
        ],
      ),
    );
  }
}

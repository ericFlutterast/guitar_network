import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../notifier/metronome_provider.dart';
import '../../../services/app_colors.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
    required this.flagOfPlay,
    required this.sizeOfIcon,
  });

  final bool flagOfPlay;
  final double sizeOfIcon;

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: flagOfPlay
              ? const Color.fromARGB(217, 195, 15, 2)
              : appColors.dimGreenColor,
        ),
        height: MediaQuery.of(context).size.height / 3.5,
        width: MediaQuery.of(context).size.height / 3.5,
        child: IconButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(200),
              ),
            ),
            overlayColor:
                MaterialStateProperty.all(const Color.fromARGB(9, 0, 0, 0)),
          ),
          onPressed: () {
            context.read<MetronomProvider>().playStop();
          },
          icon: Icon(
            flagOfPlay ? Icons.stop : Icons.play_arrow_sharp,
            color: appColors.mainAppBackgroundColor,
            size: sizeOfIcon * 3,
          ),
        ),
      ),
    );
  }
}

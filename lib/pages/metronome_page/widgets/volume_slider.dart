import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../notifier/metronome_provider.dart';
import '../../../services/app_colors.dart';

class VolumeSlider extends StatelessWidget {
  const VolumeSlider({
    super.key,
    required this.sizeOfIcon,
    required this.volume,
  });

  final double sizeOfIcon;
  final double volume;

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Icon(
          Icons.volume_up_rounded,
          size: sizeOfIcon / 1.2,
        ),
        Expanded(
          child: Slider(
            value: volume,
            onChanged: (value) {
              context.read<MetronomProvider>().updateVolume(value);
            },
            min: 0.0,
            max: 100,
            activeColor: appColors.mainAppColor,
            inactiveColor: const Color.fromARGB(58, 79, 79, 79),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../notifier/metronome_provider.dart';
import '../../../services/app_colors.dart';

class SliderOfBpm extends StatelessWidget {
  const SliderOfBpm({
    super.key,
    required this.bpm,
  });

  final double bpm;

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    return Slider(
      value: bpm,
      onChanged: (value) {
        context.read<MetronomProvider>().updateSlider(value);
      },
      min: 20,
      max: 256,
      activeColor: appColors.mainAppColor,
      inactiveColor: const Color.fromARGB(58, 79, 79, 79),
    );
  }
}

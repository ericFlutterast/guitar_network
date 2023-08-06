import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../notifier/metronome_provider.dart';
import '../../../services/app_colors.dart';

class TapSettingOnMetronom extends StatelessWidget {
  const TapSettingOnMetronom({
    super.key,
    required this.sizeOfIcon,
    required this.bpm,
  });

  final double sizeOfIcon;
  final double bpm;

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: appColors.mainAppColor,
              borderRadius: BorderRadius.circular(15),
            ),
            height: MediaQuery.of(context).size.height / 10,
            child: IconButton(
              onPressed: () {
                context.read<MetronomProvider>().decrement();
              },
              icon: Icon(
                Icons.remove,
                color: appColors.mainAppBackgroundColor,
                size: sizeOfIcon,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: appColors.mainAppColor,
              borderRadius: BorderRadius.circular(15),
            ),
            height: MediaQuery.of(context).size.height / 10,
            child: IconButton(
              onPressed: () {
                context.read<MetronomProvider>().increment();
              },
              icon: Icon(
                Icons.add,
                color: appColors.mainAppBackgroundColor,
                size: sizeOfIcon,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Center(
            child: Text(
              '${bpm.toInt()}',
              style: const TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: appColors.mainAppColor,
              borderRadius: BorderRadius.circular(15),
            ),
            height: MediaQuery.of(context).size.height / 10,
            child: IconButton(
              onPressed: () {
                context.read<MetronomProvider>().tapTempo();
              },
              icon: Icon(
                CupertinoIcons.paw,
                color: appColors.mainAppBackgroundColor,
                size: sizeOfIcon,
              ),
            ),
          ),
        )
      ],
    );
  }
}

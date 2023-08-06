import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/metronome_provider.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';
import 'package:provider/provider.dart';
import '../../Widgets/drawer.dart';
import '../../widgets/app_bar.dart';
import 'widgets/play_button.dart';
import 'widgets/slider_of_bpm.dart';
import 'widgets/tap_setting_on_meronom.dart';
import 'widgets/volume_slider.dart';

class MetronomePage extends StatelessWidget {
  const MetronomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String titleOfAppBar = 'Метроном';
    final String timeSignature =
        context.watch<MetronomProvider>().timeSignature;
    final double bpm = context.watch<MetronomProvider>().bpm;
    final double volume = context.watch<MetronomProvider>().volume;
    final double sizeOfIcon = MediaQuery.of(context).size.height / 22;
    final bool flagOfPlay = context.watch<MetronomProvider>().flagOfPlay;
    final List<Widget> dotList = context.watch<MetronomProvider>().dotList;
    const TextStyle textStyleForCupertinoPicker = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w500,
    );
    final appColors = AppColors();

    return Scaffold(
      backgroundColor: appColors.mainAppBackgroundColor,
      drawer: const MainDrawer(),
      appBar: ReturnAppBar.returnAppBar(context, titleOfAppBar),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 80,
                horizontal: MediaQuery.of(context).size.height / 110,
              ),
              child: TapSettingOnMetronom(sizeOfIcon: sizeOfIcon, bpm: bpm),
            ),
            SliderOfBpm(bpm: bpm),
            VolumeSlider(sizeOfIcon: sizeOfIcon, volume: volume),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            PlayButton(flagOfPlay: flagOfPlay, sizeOfIcon: sizeOfIcon),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 80,
            ),
            CupertinoButton.filled(
              disabledColor: CupertinoColors.inactiveGray,
              onPressed: () => showCupertinoModalPopup(
                context: context,
                builder: (_) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    width: double.infinity,
                    child: CupertinoPicker(
                      backgroundColor: Colors.white,
                      scrollController: FixedExtentScrollController(
                        initialItem: 0,
                      ),
                      itemExtent: 30,
                      onSelectedItemChanged: (value) {
                        context
                            .read<MetronomProvider>()
                            .updateTimeSignature(value);
                      },
                      children: const [
                        Text('4/4', style: textStyleForCupertinoPicker),
                        Text('3/4', style: textStyleForCupertinoPicker),
                        Text('5/6', style: textStyleForCupertinoPicker),
                        Text('6/8', style: textStyleForCupertinoPicker),
                        Text('7/8', style: textStyleForCupertinoPicker)
                      ],
                    ),
                  );
                },
              ),
              child: Text(
                timeSignature,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: dotList)
          ],
        ),
      ),
    );
  }
}

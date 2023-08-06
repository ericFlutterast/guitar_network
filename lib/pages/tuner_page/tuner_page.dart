import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/tuner_provider.dart';
import 'package:guitar_network_vkr/pages/tuner_page/widgets/row_of_string.dart';
import 'package:guitar_network_vkr/widgets/app_bar.dart';
import 'package:guitar_network_vkr/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'widgets/activate_button.dart';
import 'widgets/main_content.dart';
import 'widgets/select_tune.dart';

class TunerPage extends StatelessWidget {
  const TunerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final label = context.watch<TunerProvider>().label;
    final fontSizeForUnderButton = MediaQuery.of(context).size.width / 16;
    final marginForUnderButton = MediaQuery.of(context).size.height / 20;
    final marginForDroppedDownMenu = MediaQuery.of(context).size.height / 40;
    final borderRadiusForUnderButton = fontSizeForUnderButton * 2 - 10;
    final fontSizeForNote = MediaQuery.of(context).size.height / 7;
    final fontSizeForPlusAndMinus = MediaQuery.of(context).size.height / 13;
    final plus = context.watch<TunerProvider>().plus;
    final minus = context.watch<TunerProvider>().minus;
    final note = context.watch<TunerProvider>().note;
    final flagToBackground = context.watch<TunerProvider>().flagToBackground;
    final listWithNote = context.read<TunerProvider>().getListWithNotes;
    return Scaffold(
      appBar: ReturnAppBar.returnAppBar(context, 'Тюнер'),
      drawer: const MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SelectTune(marginForDroppedDownMenu: marginForDroppedDownMenu),
            RowOfString(listWithNote: listWithNote),
            MainContent(
                plus: plus,
                fontSizeForPlusAndMinus: fontSizeForPlusAndMinus,
                flagToBackground: flagToBackground,
                note: note,
                fontSizeForNote: fontSizeForNote,
                minus: minus),
            ActivateButton(
              marginForUnderButton: marginForUnderButton,
              borderRadiusForUnderButton: borderRadiusForUnderButton,
              label: label,
              fontSizeForUnderButton: fontSizeForUnderButton,
            ),
          ],
        ),
      ),
    );
  }
}

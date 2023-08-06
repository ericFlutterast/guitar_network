import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/note_round.dart';
import '../../../notifier/tuner_provider.dart';
import '../../../services/app_colors.dart';

class RowOfString extends StatelessWidget {
  final List<NoteRound> listWithNote;

  const RowOfString({
    super.key,
    required this.listWithNote,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    return SizedBox(
      height: MediaQuery.of(context).size.height / 15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listWithNote.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 50,
              width: 60,
              decoration: BoxDecoration(
                color: listWithNote[index].backgroundFlag
                    ? appColors.mainGreenColor
                    : appColors.mainAppBackgroundColor,
                borderRadius: BorderRadius.circular(50),
                border: listWithNote[index].borderFlag
                    ? Border.all(
                        width: 2,
                        color: Colors.black,
                      )
                    : Border.all(
                        width: 2,
                        color: Colors.transparent,
                      ),
              ),
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(50),
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        const Color.fromARGB(33, 255, 255, 255)),
                  ),
                  onPressed: () {
                    context.read<TunerProvider>().selectString(index,
                        listWithNote[index].pitch, listWithNote[index].note);
                  },
                  child: Center(
                    child: Text(
                      listWithNote[index].note,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

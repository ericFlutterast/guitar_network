import 'package:flutter/material.dart';

import '../../../services/app_colors.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
    required this.plus,
    required this.fontSizeForPlusAndMinus,
    required this.flagToBackground,
    required this.note,
    required this.fontSizeForNote,
    required this.minus,
  });

  final String plus;
  final double fontSizeForPlusAndMinus;
  final bool flagToBackground;
  final String note;
  final double fontSizeForNote;
  final String minus;

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: Text(
                plus,
                style: TextStyle(
                  fontSize: fontSizeForPlusAndMinus,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                color: flagToBackground
                    ? appColors.mainGreenColor
                    : appColors.mainAppBackgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  note,
                  style: TextStyle(
                    fontSize: fontSizeForNote,
                    color: flagToBackground
                        ? const Color.fromARGB(255, 239, 239, 239)
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                minus,
                style: TextStyle(
                  fontSize: fontSizeForPlusAndMinus,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

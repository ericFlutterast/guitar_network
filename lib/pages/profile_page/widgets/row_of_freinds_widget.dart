import 'package:flutter/material.dart';

import '../../../services/app_colors.dart';

class RowOfFreindsWidget extends StatelessWidget {
  const RowOfFreindsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();

    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        print('priv');
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 15,
        ),
        decoration: BoxDecoration(
          color: colors.mainAppColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 60,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  '207 freinds',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/images/me.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/images/max.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/images/max.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

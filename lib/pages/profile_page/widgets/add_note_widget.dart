import 'package:flutter/material.dart';

import '../../../services/app_colors.dart';

class AddNoteWidget extends StatelessWidget {
  const AddNoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/add_post_screen');
      },
      child: Container(
        decoration: BoxDecoration(
          color: colors.mainAppColor,
          borderRadius: BorderRadius.circular(size.width / 25),
        ),
        height: size.height / 15,
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: size.width / 60,
            vertical: size.width / 60,
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(120, 255, 255, 255),
            borderRadius: BorderRadius.circular(size.width / 40),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_box_rounded,
                  size: size.width / 12,
                ),
                SizedBox(width: size.width / 40),
                Text(
                  'Опубликовать',
                  style: TextStyle(
                    fontSize: size.width / 21,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

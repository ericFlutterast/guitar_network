import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/app_colors.dart';

class BottomBarOfPost extends StatelessWidget {
  final int quantityLikes;
  final int quantityRepost;

  const BottomBarOfPost({
    super.key,
    required this.quantityLikes,
    required this.quantityRepost,
  });

  ButtonStyle buttonStyle(AppColors appColors) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        appColors.mainButtonColor,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height / 90, horizontal: size.width / 18),
      child: Row(
        children: [
          ElevatedButton(
            style: buttonStyle(appColors),
            onPressed: () {},
            child: Row(
              children: [
                const Icon(Icons.favorite_border_outlined),
                const SizedBox(
                  width: 10,
                ),
                Text('$quantityLikes'),
              ],
            ),
          ),
          SizedBox(width: size.width / 40),
          ElevatedButton(
            style: buttonStyle(appColors),
            onPressed: () {},
            child: Row(
              children: const [
                Icon(CupertinoIcons.conversation_bubble),
              ],
            ),
          ),
          SizedBox(width: size.width / 40),
          ElevatedButton(
            style: buttonStyle(appColors),
            onPressed: () {},
            child: Row(
              children: [
                const Icon(Icons.ios_share_rounded),
                const SizedBox(
                  width: 10,
                ),
                Text('$quantityRepost'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

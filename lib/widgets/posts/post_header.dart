import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/app_colors.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.appColors,
    required this.urlProfileImage,
    required this.userName,
    required this.date,
  });

  final AppColors appColors;
  final String urlProfileImage;
  final String userName;
  final String date;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: size.width / 50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          height: size.height / 15,
          width: size.height / 15,
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              urlProfileImage,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                maxLines: 1,
                style: TextStyle(
                  color: appColors.mainAppBackgroundColor,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: appColors.mainAppBackgroundColor,
                  fontSize: size.width / 27,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add_box,
            color: appColors.mainAppBackgroundColor,
            size: size.width / 11,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.ellipsis,
            color: appColors.mainAppBackgroundColor,
            size: size.width / 12,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/app_colors.dart';
import 'bottom_bar_of_post.dart';
import 'post_description.dart';
import 'post_header.dart';

class NewsItem extends StatelessWidget {
  final String userName;
  final String urlProfileImage;
  final String urlContentImage;
  final String description;
  final String date;
  final int quantityLikes;
  final int quantityRepost;

  const NewsItem({
    super.key,
    required this.userName,
    required this.urlContentImage,
    required this.urlProfileImage,
    required this.description,
    required this.date,
    required this.quantityLikes,
    required this.quantityRepost,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width / 150, vertical: size.width / 70),
      width: double.infinity,
      decoration: BoxDecoration(
        color: appColors.mainAppColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: size.width / 50,
              right: size.width / 50,
              top: size.width / 25,
              bottom: size.width / 50,
            ),
            child: PostHeader(
                appColors: appColors,
                urlProfileImage: urlProfileImage,
                userName: userName,
                date: date),
          ),
          if (description.isNotEmpty) ...[
            PostDescription(description: description, appColors: appColors),
          ],
          // if (urlContentImage.isNotEmpty) ...[
          //   PostImage(urlContentImage: urlContentImage),
          // ],
          const BottomBarOfPost(
            quantityLikes: 10,
            quantityRepost: 10,
          ),
        ],
      ),
    );
  }
}

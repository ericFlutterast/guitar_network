import 'package:flutter/material.dart';

import '../../../services/app_colors.dart';

class PhotoRowWidget extends StatelessWidget {
  const PhotoRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: MediaQuery.of(context).size.height / 6,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colors.mainAppColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            ImageWrapper(imgURL: 'assets/images/me.png'),
            ImageWrapper(imgURL: 'assets/images/jeka.png'),
            ImageWrapper(imgURL: 'assets/images/max.png'),
            ImageWrapper(imgURL: 'assets/images/me.png'),
          ],
        ),
      ),
    );
  }
}

class ImageWrapper extends StatelessWidget {
  final String imgURL;

  const ImageWrapper({
    required this.imgURL,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      child: SizedBox(
        width: size.width / 3.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            imgURL,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

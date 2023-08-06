import 'package:flutter/material.dart';

import '../../services/app_colors.dart';

class PostDescription extends StatefulWidget {
  const PostDescription({
    super.key,
    required this.description,
    required this.appColors,
  });

  final String description;
  final AppColors appColors;

  @override
  State<PostDescription> createState() => _PostDescriptionState();
}

class _PostDescriptionState extends State<PostDescription> {
  bool switchOwerflow = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.width / 50),
      child: InkWell(
        onTap: () {
          setState(() {
            switchOwerflow = switchOwerflow ? false : true;
          });
        },
        child: Text(
          widget.description,
          maxLines: switchOwerflow ? null : 3,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: widget.appColors.mainAppBackgroundColor,
            fontSize: size.width / 22,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

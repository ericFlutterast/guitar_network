import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  const PostImage({
    super.key,
    required this.urlContentImage,
  });

  final String urlContentImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      width: double.infinity,
      child: Image.network(
        urlContentImage,
        fit: BoxFit.cover,
      ),
    );
  }
}

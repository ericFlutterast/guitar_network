import 'package:flutter/material.dart';

class TitleOfDrum extends StatelessWidget {
  final String title;
  final Color color;
  const TitleOfDrum({
    required this.title,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: const Border(
          bottom: BorderSide(
            width: 2,
            color: Colors.amber,
          ),
        ),
      ),
      width: width / 5,
      height: width / 6.7,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

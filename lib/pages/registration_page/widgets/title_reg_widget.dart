import 'package:flutter/material.dart';

class TitleRegWidget extends StatelessWidget {
  const TitleRegWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Регестрация',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}

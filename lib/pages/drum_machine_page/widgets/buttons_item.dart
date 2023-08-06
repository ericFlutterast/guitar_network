import 'package:flutter/material.dart';

class ButtonsItem extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final Function() onPressed;
  const ButtonsItem({
    required this.color,
    required this.iconData,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 16,
      width: MediaQuery.of(context).size.width / 2.2,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Icon(iconData),
      ),
    );
  }
}

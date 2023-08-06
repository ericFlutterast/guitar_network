import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';

class AddPostButtonWidget extends StatelessWidget {
  const AddPostButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colors.mainAppColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: () {
          print('Privet');
        },
        child: const Text(
          'Add post',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

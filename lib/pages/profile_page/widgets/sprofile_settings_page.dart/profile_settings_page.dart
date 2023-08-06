import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/profile_provider.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';
import 'package:provider/provider.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final File? image = context.watch<ProfileProvider>().newProfileImage;
    final colors = AppColors();
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.mainAppColor,
        title: const Text('Редактировать профиль'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),
          Center(
            child: Container(
              height: height / 7,
              width: height / 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: image != null
                    ? Image.file(image, fit: BoxFit.cover)
                    : Image.asset(
                        'assets/images/default_profile_image.png',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),
          CustomButton(
            colors: colors,
            title: 'Добавить фото',
            onPressed: () {
              context.read<ProfileProvider>().loadImage();
            },
          ),
          CustomTextField(
            title: 'Имя',
            controller: TextEditingController(),
          ),
          CustomTextField(
            title: 'Фамилмя',
            controller: TextEditingController(),
          ),
          CustomTextField(
            title: 'Город',
            controller: TextEditingController(),
          ),
          CustomTextField(
            title: 'Стаж игры',
            controller: TextEditingController(),
          ),
          CustomTextField(
            title: 'Номер телефона',
            controller: TextEditingController(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height / 50,
                vertical: MediaQuery.of(context).size.height / 50),
            child: TextField(
              maxLines: 10,
              controller: TextEditingController(),
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height / 45,
                fontWeight: FontWeight.w600,
              ),
              cursorColor: colors.mainAppColor,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: colors.mainAppColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: colors.mainAppColor,
                  ),
                ),
                hintText: 'Обо мне',
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),
          CustomButton(
            colors: colors,
            title: 'Сохранить',
            onPressed: () {
              context.read<ProfileProvider>().updateProfileData();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const CustomButton({
    super.key,
    required this.colors,
    required this.title,
    required this.onPressed,
  });

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 20,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(colors.mainButtonColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              )),
          onPressed: () {
            onPressed();
          },
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool errorFieldFlag;

  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    this.errorFieldFlag = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 50),
        if (errorFieldFlag)
          const Text(
            'Обязательное поле',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: controller,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 45,
              fontWeight: FontWeight.w600,
            ),
            cursorColor: colors.mainAppColor,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: errorFieldFlag ? Colors.red : colors.mainAppColor,
                ),
              ),
              hintText: title,
            ),
          ),
        ),
      ],
    );
  }
}

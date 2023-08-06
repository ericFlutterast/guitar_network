import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/models/user_data.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';
import 'package:provider/provider.dart';

import '../../notifier/auth_provider.dart';
import 'widgets/custom_text_field.dart';

class ProfileDataForm extends StatefulWidget {
  const ProfileDataForm({super.key});

  @override
  State<ProfileDataForm> createState() => _ProfileDataFormState();
}

class _ProfileDataFormState extends State<ProfileDataForm> {
  final firstName = TextEditingController();
  final secondName = TextEditingController();
  final phoneNumber = TextEditingController();
  final userCityNumber = TextEditingController();
  final aboutMe = TextEditingController();
  final experience = TextEditingController();

  bool emptyField = false;

  @override
  void initState() {
    super.initState();

    phoneNumber.text = '+7';
  }

  void onPressed() async {
    if (firstName.text.isEmpty ||
        secondName.text.isEmpty ||
        experience.text.isEmpty) {
      setState(() {
        emptyField = true;
      });
    } else {
      setState(() {
        emptyField = false;
      });
    }

    if (!emptyField) {
      UserData userData = UserData(
        firstName: firstName.text,
        secondName: secondName.text,
        phoneNumber: phoneNumber.text,
        userCity: userCityNumber.text,
        aboutMe: aboutMe.text,
        experience: experience.text,
      );

      bool flag = await context.read<AuthProvider>().createUser(userData);

      if (flag) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed('/lending_page');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();
    final height = MediaQuery.of(context).size.height;
    final File? image = context.watch<AuthProvider>().newProfileImage;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.mainAppColor,
        title: const Text('Добро пожаловать'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                context.read<AuthProvider>().loadImage();
              },
            ),
            CustomTextField(
              title: 'Имя',
              controller: firstName,
              errorFieldFlag: emptyField,
            ),
            CustomTextField(
              title: 'Фамилия',
              controller: secondName,
              errorFieldFlag: emptyField,
            ),
            CustomTextField(title: 'Город', controller: userCityNumber),
            CustomTextField(
              title: 'Стаж игры',
              controller: experience,
              errorFieldFlag: emptyField,
            ),
            CustomTextField(title: '+7', controller: phoneNumber),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height / 50,
                  vertical: MediaQuery.of(context).size.height / 50),
              child: TextField(
                maxLines: 10,
                controller: aboutMe,
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
            SafeArea(
              child: ElevatedButton(
                onPressed: () {
                  onPressed();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(colors.mainAppColor),
                ),
                child: Text(
                  'Продолжить',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 50,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    firstName.dispose();
    secondName.dispose();
    phoneNumber.dispose();
    userCityNumber.dispose();
    aboutMe.dispose();
    experience.dispose();
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

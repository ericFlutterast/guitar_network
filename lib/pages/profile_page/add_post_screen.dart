import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/profile_provider.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController controller = TextEditingController();
  bool _validationVariable = false;

  @override
  void initState() {
    //controller.text = 'hello';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    final size = MediaQuery.of(context).size;
    File? image = context.watch<ProfileProvider>().newProfileImage;

    return Scaffold(
      backgroundColor: appColors.mainAppColor,
      appBar: AppBar(
        backgroundColor: appColors.mainAppColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomField(controller: controller),
            const AddImageButton(),
            SizedBox(height: size.height / 40),
            if (image != null) ...[
              ImageWidget(image: image),
            ],
            SizedBox(height: size.height / 25),
            SafeArea(
              child: AddBautton(
                pressFunction: () {
                  if (controller.text.isNotEmpty || image != null) {
                    context.read<ProfileProvider>().addPost(controller.text);
                    Navigator.pop(context);
                  }

                  setState(() {
                    _validationVariable = _validationVariable ? false : true;
                  });

                  return;
                },
              ),
            ),
            if (_validationVariable) ...[
              Padding(
                padding: EdgeInsets.only(top: size.height / 20),
                child: Text(
                  'Заполните тектовое полк или добавьте изображение, чтобы опубликовать запись',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 249, 3, 3),
                    fontSize: size.width / 26,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AddImageButton extends StatelessWidget {
  const AddImageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: () {
        context.read<ProfileProvider>().loadImage();
      },
      child: Row(
        children: [
          const Icon(
            Icons.add_rounded,
            color: Colors.white,
          ),
          SizedBox(width: size.width / 30),
          Text(
            'Добавить изображение',
            style: TextStyle(color: Colors.white, fontSize: size.width / 22),
          ),
        ],
      ),
    );
  }
}

class CustomField extends StatelessWidget {
  final TextEditingController controller;

  const CustomField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width / 40, vertical: size.width / 50),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.white,
          fontSize: size.width / 23,
          fontWeight: FontWeight.w400,
        ),
        minLines: 5,
        maxLines: 100,
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          hintText: 'Описание',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final File image;

  const ImageWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: SizedBox(
          height: size.height / 2,
          child: Image.file(image),
        ),
      ),
    );
  }
}

class AddBautton extends StatelessWidget {
  final Function pressFunction;

  const AddBautton({
    super.key,
    required this.pressFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize:
              MaterialStatePropertyAll(MediaQuery.of(context).size / 20),
          backgroundColor: MaterialStatePropertyAll(AppColors().mainAppColor),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
        ),
        onPressed: () {
          pressFunction();
        },
        child: const Text('Добавить запись'),
      ),
    );
  }
}

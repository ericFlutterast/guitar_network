import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageControllServices {
  ImagePicker picker = ImagePicker();

  Future<File?> imgFromGallery() async {
    final newImage = await picker.pickImage(source: ImageSource.gallery);

    return newImage != null ? File(newImage.path) : null;
  }
}

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> upLoadStorage(
      File? image, String fileName, String directoryName) async {
    try {
      if (image != null) {
        await storage.ref('$directoryName/$fileName').putFile(image);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> downloandStorage(String fileName, String directory) async {
    try {
      final String imageURL =
          await storage.ref('$directory/$fileName').getDownloadURL();

      return imageURL;
    } catch (e) {
      print(e);
    }
    return '';
  }
}

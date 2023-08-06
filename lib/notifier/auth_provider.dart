import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/models/user.dart';
import 'package:guitar_network_vkr/services/auth_firebase.dart';

import '../models/user_data.dart';
import '../services/image_controll_services.dart';

class AuthProvider with ChangeNotifier {
  String? login;
  String? password;
  String? copyPassword;
  File? _newProfileImage;

  set setLogint(String value) => login = value;
  set setPassword(String value) => password = value;
  set setCopyPassword(String value) => copyPassword = value;
  File? get newProfileImage => _newProfileImage;

  final _authFirebase = AuthFirebase();

  Future<void> auth() async {
    UserIsAuth().user = await _authFirebase.signInWithMailAndOassword(
        login.toString().trim(), password.toString().trim());
  }

  Future<bool> createUser(UserData userData) async {
    if (password == copyPassword) {
      UserIsAuth().user = await _authFirebase.registrationWithEmailAndPassword(
          login.toString().trim(),
          password.toString().trim(),
          userData,
          _newProfileImage);

      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<void> loadImage() async {
    _newProfileImage = await ImageControllServices().imgFromGallery();

    notifyListeners();
  }
}

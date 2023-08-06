import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:guitar_network_vkr/services/cloud_firestore.dart';
import 'package:guitar_network_vkr/services/storage_services.dart';
import '../models/user.dart';
import '../models/user_data.dart';

class AuthFirebase {
  //создаем переменную которая схранить шаблон аунтификации
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //Метод геттер для отслeживания изменений
  Stream<AppUser?> get currentUser => _firebaseAuth.userChanges().map(
        (User? user) => user != null ? AppUser.fromFirebase(user) : null,
      );

  //Метод логина
  Future<AppUser?> signInWithMailAndOassword(
      String mail, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: mail, password: password);
      User? user = result.user;

      return AppUser.fromFirebase(user);
    } catch (error) {
      return null;
    }
  }

  //Метод регистрации
  Future<AppUser?> registrationWithEmailAndPassword(
      String mail, password, UserData userData, File? profileImage) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: mail, password: password);
      User? user = result.user!;

      userData.uid = user.uid;

      Storage().upLoadStorage(profileImage, user.uid, 'avatars');
      CloudFirestore().userDataToFirestore(userData);

      return AppUser.fromFirebase(user);
    } catch (error) {
      print(error);
      return null;
    }
  }

  //Метод выхода
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

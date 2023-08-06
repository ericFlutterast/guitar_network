import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  String? _uid;

  AppUser.fromFirebase(User? user) {
    _uid = user!.uid;
  }

  String get uid => _uid.toString();
}

class UserIsAuth {
  AppUser? user;
}

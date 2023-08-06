import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/messager_model.dart';
import '../models/user_data.dart';
import 'storage_services.dart';

class CloudFirestore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void userDataToFirestore(UserData userData) {
    final data = <String, dynamic>{
      "firstName": userData.firstName,
      "secondName": userData.secondName,
      "userCity": userData.userCity,
      "aboutMe": userData.aboutMe,
      "experience": userData.experience,
      "phoneNumber": userData.phoneNumber,
      "uid": userData.uid,
    };

    _firestore.collection('dataUser').doc(userData.uid).set(data);
  }

  Future<UserData> userDataFromFirestore(String uid) async {
    final doc = _firestore.collection('dataUser').doc(uid);
    var userData;

    await doc.get().then((store) {
      var storeData = store.data()!;

      userData = UserData.fromJson(storeData);
    });

    return userData;
  }

  Future<List<DialogItem>> getDialogs() async {
    List<DialogItem> dialogs = [];

    final doc = _firestore.collection('chats');

    await doc.get().then((value) {
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          //dialogs.add(element);
        }
      }
    });

    return dialogs;
  }

  Future<List<UserData>> getInterlocators() async {
    List<UserData> interlocators = [];

    final doc = _firestore.collection('dataUser');

    await doc.get().then((value) {
      for (var element in value.docs) {
        interlocators.add(UserData.fromJson(element.data()));
      }
    });

    try {
      for (var element in interlocators) {
        element.img = await Storage().downloandStorage(element.uid, 'avatars');
      }
    } catch (e) {
      throw Exception('исключение');
    }

    return interlocators;
  }
}

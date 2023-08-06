import 'package:firebase_database/firebase_database.dart';
import 'package:guitar_network_vkr/models/messager_model.dart';

import '../models/post_item_model.dart';

class FirebaseRealtimeDatabase {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  DialogItem? _dialog;

  get dialog => _dialog;
  FirebaseDatabase get database => _database;

  Future<void> updateListOfMessage(
      String dialogId, List<Message> listOfMessage) async {
    final ref = _database.ref('chats/$dialogId');

    ref.update(
        {'listOfMessage': listOfMessage.map((e) => e.toJson()).toList()});
  }

  Future<void> addDialog(
      String interlocatorID, String thisUID, DialogItem dialog) async {
    final String id = _makeIdForSearh(2, interlocatorID, thisUID);

    await _database.ref('chats/$id').set(dialog.toFirestoreDatabase());
    await _database.ref('chatsId/$id').set(id);
  }

  Future<String> getDialogId(String thisUid, String interlocatorId) async {
    String substringOne = _makeIdForSearh(1, thisUid).toString();
    String substringTwo = _makeIdForSearh(2, interlocatorId).toString();
    String result = '';

    final cahtsID = await _database.ref('chatsId').get();

    if (cahtsID.exists) {
      (cahtsID.value as Map<Object?, Object?>).forEach((key, value) {
        if ((value as String).contains(substringOne) &&
            (value).contains(substringTwo)) {
          result = value;
        }
      });
    }

    return result;
  }

  ///if key = 1, then function returned substring userOne,
  ///if key = 2, then function returned substring userTwo,
  String _makeIdForSearh(int key, String userOne, [String userTwo = '']) {
    if (key == 1) {
      return userOne.substring(0, userOne.length ~/ 2);
    }

    if (key == 2) {
      return userOne.substring(0, userOne.length ~/ 2) +
          userTwo.substring(0, userTwo.length ~/ 2);
    }

    return '';
  }

  Future<void> addPost(String postId, List<PostItemModel> listOfPost) async {
    _database.ref('post').update(
        {'posts': listOfPost.map((e) => e.toRealTimeDataBase()).toList()});
  }
}

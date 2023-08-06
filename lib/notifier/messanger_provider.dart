import 'package:flutter/widgets.dart';
import 'package:guitar_network_vkr/models/messager_model.dart';

import '../models/user_data.dart';
import '../services/cloud_firestore.dart';
import '../services/firebase_realtime_database_serveces.dart';

class MessangerProvider extends ChangeNotifier {
  FirebaseRealtimeDatabase dataBase = FirebaseRealtimeDatabase();
  List<UserData> _interlocatorsList = [];
  int? _interlocatorIndex;
  String? _dialogId;

  set setUserIdex(int newIndex) => _interlocatorIndex = newIndex;

  String get dialogId => _dialogId.toString();
  int? get userIndex => _interlocatorIndex;
  UserData get interlocatorData =>
      _interlocatorsList[_interlocatorIndex as int];

  List<UserData> get interlocatorsList => _interlocatorsList;

  void toGetData(String thisUid) async {
    _interlocatorsList = await CloudFirestore().getInterlocators();

    notifyListeners();
  }

  void sendMessage(String dialogId, List<Message> listOfMessage) {
    dataBase.updateListOfMessage(dialogId, listOfMessage);

    notifyListeners();
  }

  Future<void> getDialogId(String thisUid) async {
    final interlocatorId = _interlocatorsList[_interlocatorIndex as int].uid;

    _dialogId = await dataBase.getDialogId(thisUid, interlocatorId);

    if (_dialogId.toString().isEmpty) {
      await initDialog(thisUid);
      _dialogId = await dataBase.getDialogId(thisUid, interlocatorId);
    }
  }

  Future<void> initDialog(String thisUID) async {
    String interlocatorID = _interlocatorsList[_interlocatorIndex as int].uid;

    DialogItem dialog = DialogItem(
      thisUserId: thisUID,
      inerlocatorId: interlocatorID,
      listOfMessage: <Message>[Message(dateTime: '', senderId: '')],
    );

    await dataBase.addDialog(interlocatorID, thisUID, dialog);
  }
}

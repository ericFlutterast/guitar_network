class Message {
  String text;
  String senderId;
  String dateTime;

  Message({
    required this.dateTime,
    required this.senderId,
    this.text = '',
  });

  factory Message.fromFirebaseDatabase(Map<Object?, dynamic> data) {
    return Message(
      text: data['text'],
      dateTime: data['dateTime'],
      senderId: data['senderId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'text': text,
        'dateTime': dateTime,
        'senderId': senderId,
      };
}

class DialogItem {
  final String inerlocatorId;
  final String thisUserId;

  List<Message> listOfMessage;

  DialogItem({
    required this.thisUserId,
    required this.inerlocatorId,
    required this.listOfMessage,
  });

  factory DialogItem.fromFirebaseDatabase(Map<Object?, dynamic> data) {
    return DialogItem(
      inerlocatorId: data['inerlocatorId'],
      thisUserId: data['thisUserId'],
      listOfMessage: (data['listOfMessage'] as List<Object?>)
          .map((e) => Message.fromFirebaseDatabase(e as Map<Object?, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toFirestoreDatabase() => {
        'inerlocatorId': inerlocatorId,
        'thisUserId': thisUserId,
        'listOfMessage': listOfMessage.map((e) => e.toJson()).toList(),
      };
}

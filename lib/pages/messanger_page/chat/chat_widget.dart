import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/models/user.dart';
import 'package:guitar_network_vkr/notifier/messanger_provider.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../models/messager_model.dart';
import '../../../models/user_data.dart';
import '../../../services/firebase_realtime_database_serveces.dart';
import 'widgets/chat_message_text_field.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final firebaseRealtimeDatabase = FirebaseRealtimeDatabase();
  final TextEditingController controller = TextEditingController();
  late StreamSubscription<DatabaseEvent> streamSubscription;
  List<Message> listOfMessage = [];

  void sendMessage() {
    if (controller.text.isEmpty) return;

    final dataTime = DateTime.now().toString().substring(11, 16);
    final dialogId = context.read<MessangerProvider>().dialogId;

    context.read<MessangerProvider>().sendMessage(
      dialogId,
      [
        Message(
          dateTime: dataTime,
          senderId: context.read<AppUser>().uid,
          text: controller.text,
        ),
        ...listOfMessage,
      ],
    );
    controller.text = '';
  }

  @override
  void initState() {
    super.initState();

    final dialogId = context.read<MessangerProvider>().dialogId;
    final database = firebaseRealtimeDatabase.database;

    streamSubscription =
        database.ref('chats/$dialogId/listOfMessage').onValue.listen((event) {
      final data = event.snapshot.value;

      listOfMessage = (data as List<Object?>)
          .map((e) => Message.fromFirebaseDatabase(e as Map<Object?, dynamic>))
          .toList();

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    final UserData user = context.read<MessangerProvider>().interlocatorData;
    final thisUserID = context.watch<AppUser>().uid;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.mainAppColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${user.firstName} ${user.secondName}'),
            const SizedBox(width: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width / 8.5,
              height: MediaQuery.of(context).size.width / 8.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: user.img != ''
                    ? Image.network(user.img, fit: BoxFit.cover)
                    : Image.asset(
                        'assets/images/default_profile_image.png',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: listOfMessage.length,
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: thisUserID == listOfMessage[index].senderId
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  if (thisUserID == listOfMessage[index].senderId)
                    Text(
                      listOfMessage[index].dateTime,
                    ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: appColors.mainAppColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        listOfMessage[index].text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width / 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  if (thisUserID != listOfMessage[index].senderId)
                    Text(
                      listOfMessage[index].dateTime,
                    ),
                ],
              ),
            ),
          ),
          ColoredBox(
            color: appColors.mainAppColor,
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt,
                        size: MediaQuery.of(context).size.width / 15,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: SendMessageTextField(
                        controller: controller,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        sendMessage();
                      },
                      icon: Icon(
                        Icons.send,
                        size: MediaQuery.of(context).size.width / 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    streamSubscription.cancel();
    super.dispose();
  }
}

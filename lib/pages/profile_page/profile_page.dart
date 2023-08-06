import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/profile_provider.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';
import 'package:guitar_network_vkr/widgets/app_bar.dart';
import 'package:guitar_network_vkr/widgets/drawer.dart';
import 'package:guitar_network_vkr/widgets/posts/news_item.dart';
import 'package:provider/provider.dart';
import '../../models/post_item_model.dart';
import '../../models/user.dart';
import 'widgets/add_note_widget.dart';
import 'widgets/add_post_widget.dart';
import 'widgets/main_acc_photo_widget.dart';
import 'widgets/name_widget.dart';
import 'widgets/personal_information_widget.dart';
import 'widgets/photo_row_widget.dart';
import 'widgets/row_of_freinds_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late StreamSubscription<DatabaseEvent> streamSubscription;
  final FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  List<NewsItem> _listOfNews = [];

  @override
  void initState() {
    super.initState();

    final thisUserId = context.read<AppUser>().uid;

    streamSubscription = firebaseDatabase.ref('post').onValue.listen((event) {
      final data = event.snapshot.value;

      _listOfNews =
          ListOfPostModel.fromRealTimeDataBase(data as Map<Object?, dynamic>)
              .listOfPosts
              .where((element) => element.userId == thisUserId)
              .map((element) => NewsItem(
                  userName: element.userName,
                  urlContentImage: element.urlContentImage,
                  urlProfileImage: element.urlProfileImage,
                  description: element.description,
                  date: element.date,
                  quantityLikes: element.quantityLikes,
                  quantityRepost: element.quantityRepost))
              .toList();

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();

    final String uid = context.watch<AppUser>().uid;
    context.read<ProfileProvider>().initData(uid);

    return Scaffold(
      appBar: ReturnAppBar.returnAppBar(context, 'Мой профиль'),
      drawer: const MainDrawer(),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/profile_settings_page');
                    },
                    child: Text(
                      'Изм.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: colors.mainAppColor,
                      ),
                    ),
                  ),
                ],
              ),

              //main acc photo
              const MainAccPhotoWidget(),
              const NameWidget(),
              const PersonalInformationWidget(),
              const AddPostButtonWidget(),
              const RowOfFreindsWidget(),
              const PhotoRowWidget(),
              const AddNoteWidget(),
              ..._listOfNews,
            ],
          ),
        ),
      ),
    );
  }
}

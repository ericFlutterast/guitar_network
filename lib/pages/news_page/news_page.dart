import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';
import 'package:guitar_network_vkr/widgets/drawer.dart';

import '../../models/post_item_model.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/posts/news_item.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late StreamSubscription<DatabaseEvent> streamSubscription;
  final FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  List<PostItemModel> _listOfNews = [];

  @override
  void initState() {
    super.initState();

    streamSubscription = firebaseDatabase.ref('post').onValue.listen((event) {
      final data = event.snapshot.value;

      _listOfNews =
          ListOfPostModel.fromRealTimeDataBase(data as Map<Object?, dynamic>)
              .listOfPosts;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    const titleOfAppBar = 'Новости';
    final appColors = AppColors();

    return Scaffold(
      drawer: const MainDrawer(),
      backgroundColor: appColors.mainAppBackgroundColor,
      appBar: ReturnAppBar.returnAppBar(context, titleOfAppBar),
      body: ListView.builder(
        itemCount: _listOfNews.length,
        itemBuilder: (context, index) {
          return NewsItem(
            userName: _listOfNews[index].userName,
            urlProfileImage: _listOfNews[index].urlProfileImage,
            urlContentImage: _listOfNews[index].urlContentImage,
            description: _listOfNews[index].description,
            quantityLikes: _listOfNews[index].quantityLikes,
            quantityRepost: _listOfNews[index].quantityRepost,
            date: _listOfNews[index].date,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }
}

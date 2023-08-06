import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/posts/news_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<NewsItem> listOgNews = const [
    NewsItem(
      userName: 'Eric Flutter',
      urlProfileImage: 'assets/images/me.png',
      urlContentImage: 'assets/images/me.png',
      description:
          'Hi my name is farid, today we learn how to writing flutter application,Hi my name is farid, today we learn how to writing flutter application',
      quantityLikes: 69,
      quantityRepost: 7,
      date: 'one hour ago',
    ),
    NewsItem(
      userName: 'Maxim Flutter',
      urlProfileImage: 'assets/images/max.png',
      urlContentImage: 'assets/images/max.png',
      description: '',
      quantityLikes: 55,
      quantityRepost: 3,
      date: 'two days ago',
    ),
    NewsItem(
      userName: 'Biutiful Girl',
      urlProfileImage: 'assets/images/girl.png',
      urlContentImage: 'assets/images/girl.png',
      description:
          'Hi my name is farid, today we learn how to writing flutter application,',
      quantityLikes: 22,
      quantityRepost: 3,
      date: '23.07.2022',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const titleOfAppBar = 'Новости';
    final appColors = AppColors();
    return Scaffold(
      drawer: const MainDrawer(),
      backgroundColor: appColors.mainAppBackgroundColor,
      appBar: ReturnAppBar.returnAppBar(context, titleOfAppBar),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listOgNews.length,
              itemBuilder: (context, index) {
                return listOgNews[index];
              },
            ),
          ),
          Container(
            color: appColors.mainAppColor,
            height: MediaQuery.of(context).size.height / 9.5,
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.home,
                      size: 30,
                      color: appColors.mainAppBackgroundColor,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/messanger_page');
                    },
                    icon: const Icon(
                      CupertinoIcons.bubble_left_fill,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.profile_circled,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

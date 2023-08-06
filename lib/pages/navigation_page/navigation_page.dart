import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/pages/messanger_page/messanger_page.dart';
import 'package:guitar_network_vkr/pages/news_page/news_page.dart';
import 'package:guitar_network_vkr/pages/profile_page/profile_page.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';

import '../../widgets/drawer.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  var _index = 0;

  void _switchIndex(int oldIndex) {
    setState(() {
      _index = oldIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    return Scaffold(
      drawer: const MainDrawer(),
      backgroundColor: appColors.mainAppColor,
      body: IndexedStack(
        index: _index,
        children: [
          NewsPage(),
          const MessangerPage(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.bubble_left_fill,
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.profile_circled,
            ),
            label: 'profile',
          ),
        ],
        currentIndex: _index,
        onTap: _switchIndex,
        selectedItemColor: Colors.white,
        backgroundColor: appColors.mainAppColor,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/Widgets/drawer.dart';
import 'package:guitar_network_vkr/models/user.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';
import 'package:guitar_network_vkr/widgets/app_bar.dart';
import 'package:provider/provider.dart';

import '../../notifier/messanger_provider.dart';

class MessangerPage extends StatelessWidget {
  const MessangerPage({super.key});

  @override
  Widget build(BuildContext context) {
    String thisUserId = context.watch<AppUser>().uid;
    context.read<MessangerProvider>().toGetData(thisUserId);

    final interlocatorsList =
        context.watch<MessangerProvider>().interlocatorsList;

    const lablde = 'Мессенджер';
    final appColors = AppColors();

    return Scaffold(
      appBar: ReturnAppBar.returnAppBar(context, lablde),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          const SearchDialogWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: interlocatorsList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () async {
                  context.read<MessangerProvider>().setUserIdex = index;
                  await context
                      .read<MessangerProvider>()
                      .getDialogId(thisUserId);
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushNamed('/chat_widget');
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 0),
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 1, color: Colors.black),
                          color: const Color.fromARGB(255, 221, 221, 221),
                        ),
                        child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.circular(50),
                          child: interlocatorsList[index].img != ''
                              ? Image.network(
                                  interlocatorsList[index].img,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/default_profile_image.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${interlocatorsList[index].firstName} ${interlocatorsList[index].secondName}',
                              maxLines: 1,
                              style: TextStyle(
                                color: appColors.mainAppColor,
                                fontSize:
                                    MediaQuery.of(context).size.width / 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Вы: привет',
                              style: TextStyle(
                                color: appColors.mainAppColor,
                                fontSize:
                                    MediaQuery.of(context).size.width / 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchDialogWidget extends StatelessWidget {
  const SearchDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: TextField(
        cursorColor: appColors.mainAppColor,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 20,
        ),
        decoration: InputDecoration(
          hintText: 'Поиск',
          hintStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.width / 20,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: appColors.mainAppColor,
            ),
          ),
        ),
      ),
    );
  }
}

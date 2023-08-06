import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/services/auth_firebase.dart';
import 'package:provider/provider.dart';
import '../models/theory_and_practic_model.dart';
import '../models/user.dart';
import '../notifier/profile_provider.dart';
import '../services/app_colors.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String uid = context.watch<AppUser>().uid;
    context.read<ProfileProvider>().initData(uid);

    final String profileImg = context.watch<ProfileProvider>().imageURL;
    final String firstName =
        context.watch<ProfileProvider>().userData!.firstName;
    final String secondName =
        context.watch<ProfileProvider>().userData!.secondName;

    final appColors = AppColors();
    return Drawer(
      backgroundColor: appColors.mainAppBackgroundColor,
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: appColors.mainAppColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 3.5,
                      width: MediaQuery.of(context).size.height / 7.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: profileImg != ''
                            ? Image.network(
                                profileImg,
                                fit: BoxFit.fitWidth,
                              )
                            : Image.asset(
                                'assets/images/default_profile_image.png',
                                fit: BoxFit.fitWidth,
                              ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width / 25),
                    Text(
                      '$firstName $secondName',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width / 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Домой'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/navigation_page');
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.decrease_indent),
              title: const Text('Теоритическая база'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  '/theory_data_page',
                  arguments: TheoryModel(),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.explore),
              title: const Text('Упражнения'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  '/theory_data_page',
                  arguments: PracticModel(),
                );
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.metronome),
              title: const Text('Метроном'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/metronome_page');
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.add_circled),
              title: const Text('бит-машина'),
              onTap: () {
                Navigator.of(context).pushNamed('/drum_machine_page');
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.tuningfork),
              title: const Text('Тюнер'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/tuner_page');
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Настройки'),
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Выход'),
              onTap: () {
                AuthFirebase().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}

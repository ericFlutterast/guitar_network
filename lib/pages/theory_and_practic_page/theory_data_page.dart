import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';
import 'package:guitar_network_vkr/widgets/app_bar.dart';
import 'package:guitar_network_vkr/widgets/drawer.dart';

import '../../models/theory_and_practic_model.dart';

class TheoryAndPracticPage extends StatelessWidget {
  const TheoryAndPracticPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as TheoryPracticData;

    return Scaffold(
      appBar: ReturnAppBar.returnAppBar(context, data.titlePage),
      drawer: const MainDrawer(),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: data.listOfTheameName.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              print(data.listOfTheameName[index]);
              Navigator.of(context).pushNamed('/webview_widget',
                  arguments: data.listOfTheameName[index]);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors().mainAppColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ListTile(
                  leading: Text(
                    '${index + 1}.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  title: Text(
                    data.listOfTheameName[index].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

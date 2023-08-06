import 'package:flutter/material.dart';

import 'package:guitar_network_vkr/notifier/profile_provider.dart';
import 'package:provider/provider.dart';

class NameWidget extends StatefulWidget {
  const NameWidget({
    super.key,
  });

  @override
  State<NameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    final String firstName =
        context.watch<ProfileProvider>().userData!.firstName;
    final String secondName =
        context.watch<ProfileProvider>().userData!.secondName;
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            flag = context.read<ProfileProvider>().updateFlag(flag);
          });
        },
        child: Column(
          children: [
            Text(
              '$firstName $secondName',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            if (flag) const PersonalUserInformatinon(),
          ],
        ),
      ),
    );
  }
}

class PersonalUserInformatinon extends StatelessWidget {
  const PersonalUserInformatinon({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: MediaQuery.of(context).size.width / 25,
      fontWeight: FontWeight.w500,
    );
    final String phoneNumber =
        context.watch<ProfileProvider>().userData!.phoneNumber;
    final String city = context.watch<ProfileProvider>().userData!.userCity;
    final String experience =
        context.watch<ProfileProvider>().userData!.experience;

    final double padding = MediaQuery.of(context).size.width / 20;

    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Телефон: $phoneNumber', style: textStyle),
          SizedBox(height: MediaQuery.of(context).size.width / 100),
          Text('Город: $city', style: textStyle),
          SizedBox(height: MediaQuery.of(context).size.width / 100),
          Text('Стаж игры: $experience', style: textStyle),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/profile_provider.dart';
import 'package:provider/provider.dart';

class PersonalInformationWidget extends StatefulWidget {
  const PersonalInformationWidget({
    super.key,
  });

  @override
  State<PersonalInformationWidget> createState() =>
      _PersonalInformationWidgetState();
}

class _PersonalInformationWidgetState extends State<PersonalInformationWidget> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    final personalInformation =
        context.watch<ProfileProvider>().userData!.aboutMe;

    if (personalInformation.isEmpty) {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: InkWell(
          onTap: () {
            setState(() {
              flag = context.read<ProfileProvider>().updateFlag(flag);
            });
          },
          child: Center(
            child: Text(
              personalInformation,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                overflow: flag ? TextOverflow.visible : TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      );
    }
  }
}

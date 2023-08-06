import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/profile_provider.dart';
import 'package:provider/provider.dart';

class MainAccPhotoWidget extends StatelessWidget {
  const MainAccPhotoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String profileImg = context.watch<ProfileProvider>().imageURL;
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          print('open photo');
        },
        child: Container(
          height: height / 7,
          width: height / 7,
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
      ),
    );
  }
}

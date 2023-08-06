import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/pages/auth_page/auth_page.dart';
import 'package:guitar_network_vkr/pages/navigation_page/navigation_page.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class LendingPage extends StatelessWidget {
  const LendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppUser? user = context.watch<AppUser?>();
    final bool isLoggedIn = user != null;

    if (isLoggedIn) {
      return const NavigationPage();
    } else {
      return const AuthPage();
    }
  }
}

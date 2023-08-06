import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/auth_provider.dart';
import 'package:guitar_network_vkr/pages/auth_page/widgets/registration_button.dart';
import 'package:guitar_network_vkr/pages/auth_page/widgets/title.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';
import 'package:provider/provider.dart';
import 'widgets/custom_text_tieldform.dart';
import 'widgets/enter_batton.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final loginFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    loginFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void setLogin(String value) {
    context.read<AuthProvider>().setLogint = value;
  }

  void setPassword(String value) {
    context.read<AuthProvider>().setPassword = value;
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();
    return Scaffold(
      backgroundColor: colors.mainAppBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.5,
            ),
            const TitleWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            CustomTextFieldForm(
              obscure: false,
              getValue: setLogin,
              focuseNode: loginFocusNode,
              label: 'Эл. почта/Номер телефона',
              iconData: Icons.mail,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            CustomTextFieldForm(
              obscure: true,
              getValue: setPassword,
              focuseNode: passwordFocusNode,
              label: 'Пароль',
              iconData: Icons.lock_rounded,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            const RegistrationButton(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            const EnterButton(),
          ],
        ),
      ),
    );
  }
}

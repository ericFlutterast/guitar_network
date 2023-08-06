import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/auth_provider.dart';
import 'package:guitar_network_vkr/pages/auth_page/widgets/custom_text_tieldform.dart';
import 'package:provider/provider.dart';
import '../../services/app_colors.dart';
import 'widgets/title_reg_widget.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _loginFocuseNode = FocusNode();
  final _passwordFocuseNode = FocusNode();
  final _passwordCopyFocuseNode = FocusNode();

  bool _validator = false;

  @override
  void initState() {
    _loginFocuseNode.addListener(() {
      setState(() {});
    });
    _passwordCopyFocuseNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void _next() {
    Navigator.of(context).pushNamed('/profile_data_form');
  }

  void _previous() {
    Navigator.of(context).pop();
  }

  void _setLogin(String value) {
    if (value.isEmpty) {
      _validator = false;
    } else {
      context.read<AuthProvider>().setLogint = value;
      _validator = true;
    }

    setState(() {});
  }

  void _setPassword(String value) {
    if (value.isEmpty) {
      _validator = false;
    } else {
      context.read<AuthProvider>().setPassword = value;
      _validator = true;
    }

    setState(() {});
  }

  void _setPasswordCopy(String value) {
    if (value.isEmpty) {
      _validator = false;
    } else {
      context.read<AuthProvider>().setCopyPassword = value;
      _validator = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    return Scaffold(
      backgroundColor: appColors.mainAppBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            const TitleRegWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            const Icon(
              Icons.app_registration_rounded,
              size: 50,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            CustomTextFieldForm(
              obscure: false,
              getValue: _setLogin,
              focuseNode: _loginFocuseNode,
              label: 'Эл. почта/номер телефона',
              iconData: Icons.mail,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            CustomTextFieldForm(
              obscure: true,
              getValue: _setPassword,
              focuseNode: _passwordFocuseNode,
              label: 'Пароль',
              iconData: Icons.lock,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            CustomTextFieldForm(
              obscure: true,
              getValue: _setPasswordCopy,
              focuseNode: _passwordCopyFocuseNode,
              label: 'Повторить пароль',
              iconData: Icons.lock,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
            // if (!_validator)
            //   Text(
            //     'Заполните поля',
            //     style: TextStyle(
            //       color: Colors.red,
            //       fontSize: MediaQuery.of(context).size.width / 20,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  label: 'Назад',
                  navigator: _previous,
                ),
                CustomButton(
                  label: 'Далее',
                  navigator: _validator ? _next : () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final Function() navigator;
  const CustomButton({
    required this.navigator,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(appColors.mainAppColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      onPressed: () {
        navigator();
      },
      child: Text(
        label,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/auth_provider.dart';
import 'package:guitar_network_vkr/notifier/dram_machine_provider.dart';
import 'package:guitar_network_vkr/notifier/metronome_provider.dart';
import 'package:guitar_network_vkr/notifier/profile_provider.dart';
import 'package:guitar_network_vkr/notifier/tuner_provider.dart';
import 'package:guitar_network_vkr/pages/auth_page/auth_page.dart';
import 'package:guitar_network_vkr/pages/metronome_page/metronome_page.dart';
import 'package:guitar_network_vkr/pages/profile_data_form/profile_data_form.dart';
import 'package:guitar_network_vkr/pages/profile_page/add_post_screen.dart';
import 'package:guitar_network_vkr/services/auth_firebase.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'models/user.dart';
import 'notifier/messanger_provider.dart';
import 'pages/drum_machine_page/drum_machine_page.dart';
import 'pages/lending_page/lending_page.dart';
import 'pages/messanger_page/chat/chat_widget.dart';
import 'pages/navigation_page/navigation_page.dart';
import 'pages/profile_page/widgets/sprofile_settings_page.dart/profile_settings_page.dart';
import 'pages/registration_page/registration_page.dart';
import 'pages/theory_and_practic_page/theory_data_page.dart';
import 'pages/theory_and_practic_page/web_view.dart';
import 'pages/tuner_page/tuner_page.dart';

void main() async {
  //инициализыция фaербейз
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(
            value: AuthFirebase().currentUser, initialData: UserIsAuth().user),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => MetronomProvider()),
        ChangeNotifierProvider(create: (context) => TunerProvider()),
        ChangeNotifierProvider(create: (context) => DrumMachineProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => MessangerProvider()),
      ],
      child: MaterialApp(
        title: 'Guitar Network',
        routes: {
          '/lending_page': (context) => const LendingPage(),
          '/auth_page': (context) => const AuthPage(),
          '/registration_page': (context) => const RegistrationPage(),
          '/navigation_page': (context) => const NavigationPage(),
          '/drum_machine_page': (context) => const DrumMachinePage(),
          '/metronome_page': (context) => const MetronomePage(),
          '/tuner_page': (context) => const TunerPage(),
          '/profile_settings_page': (context) => const ProfileSettingsPage(),
          '/profile_data_form': (context) => const ProfileDataForm(),
          '/chat_widget': (context) => const ChatWidget(),
          '/theory_data_page': (context) => const TheoryAndPracticPage(),
          '/webview_widget': (context) => const WebViewPage(),
          '/add_post_screen': (context) => const AddPostScreen(),
        },
        initialRoute: '/lending_page',
      ),
    );
  }
}

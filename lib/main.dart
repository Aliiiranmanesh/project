import 'package:flutter/material.dart';
import 'package:project/pages/login_page.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

void main() async {
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, currentMode, child) {
          return MaterialApp(
            theme: ThemeData(primarySwatch: Colors.blueGrey),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            title: 'GoJo',
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
          );
        });
  }
}

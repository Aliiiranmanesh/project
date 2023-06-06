import 'package:flutter/material.dart';
import 'package:project/components/IconWidget.dart';
import 'package:project/main.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'AccountPage.dart';
import 'login_page.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  static const KeyDarkMode = "key-darkmode";

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(24),
            children: [
              SettingsGroup(
                title: 'کلیات',
                children: <Widget>[
                  AccountPage(),
                  buildLogout(),
                  buildDeletAccount(),
                  buildDarkMode(),
                ],
              )
            ],
          ),
        ),
      );

  Widget buildLogout() => SimpleSettingsTile(
        title: 'خروج از حساب کاربری',
        subtitle: '',
        leading: IconWidget(
          icon: Icons.logout_rounded,
          color: Colors.black87,
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const LoginPage();
            },
          ));
        },
      );

  Widget buildDeletAccount() => SimpleSettingsTile(
        title: 'حذف کردن حساب کاربری',
        subtitle: '',
        leading: IconWidget(
          icon: Icons.delete_rounded,
          color: Colors.pink,
        ),
        onTap: () {},
      );

  Widget buildDarkMode() => SwitchSettingsTile(
        title: 'Dark Mode',
        settingKey: KeyDarkMode,
        leading: IconWidget(
          icon: Icons.dark_mode_rounded,
          color: Color(0xFF642ef3),
        ),
        onChange: (_) {
          MyApp.themeNotifier.value =
              MyApp.themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
        },
      );
}

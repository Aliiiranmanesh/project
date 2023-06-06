import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:project/components/IconWidget.dart';

class AccountPage extends StatelessWidget {
  static const keyPassword = "key-password";

  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'تنظیمات کاربر',
        subtitle: 'حریم شخصی و امنیت',
        leading: IconWidget(icon: Icons.person, color: Colors.green),
        child: SettingsScreen(
          title: 'تنظیمات کاربری',
          children: <Widget>[
            buildPrivacy(context),
            buildAccountInfo(context),
            buildPassword(),
          ],
        ),
      );

  buildAccountInfo(BuildContext context) => SimpleSettingsTile(
        title: 'اطلاعات کاربر',
        subtitle: '',
        leading: IconWidget(
          icon: Icons.text_snippet_rounded,
          color: Colors.purple,
        ),
        onTap: () {},
      );

  Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
        title: 'حریم شخصی',
        subtitle: '',
        leading: IconWidget(
          icon: Icons.lock,
          color: Colors.blue,
        ),
        onTap: () {},
      );

  Widget buildPassword() => TextInputSettingsTile(
        settingKey: keyPassword,
        title: 'رمز ورود',
        obscureText: true,
        validator: (password) => password != null && password.length >= 6
            ? null
            : '!بیش از شش کارکتر وارد کن',
      );
}

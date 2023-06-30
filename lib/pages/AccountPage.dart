import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/components/IconWidget.dart';
import 'package:project/pages/accountDetail.dart';
import 'package:project/pages/PaymentPage.dart';
import 'package:quickalert/quickalert.dart';

class AccountPage extends StatefulWidget {
  static const keyPassword = "key-password";

  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  void showAlert() {
    var message = '';
    QuickAlert.show(
      context: context,
      type: QuickAlertType.custom,
      barrierDismissible: true,
      confirmBtnText: 'پرداخت',
      customAsset: 'lib/Asset/money.jpg',
      widget: TextFormField(
        decoration: const InputDecoration(
          alignLabelWithHint: true,
          hintText: 'مبلغ مورد نظر را پرداخت کنید',
          prefixIcon: Icon(
            Icons.attach_money_rounded,
          ),
        ),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.phone,
        onChanged: (value) => message = value,
      ),
      onConfirmBtnTap: () async {
        if (message.length < 4) {
          await QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: 'مبلغ کمتر از یک هزار تومان نمیتواند باشد',
          );
          return;
        }
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return PaymentPage(
              amount: message,
            );
          },
        ));
      },
      title: 'اعتبار',
      text: 'مبلغ به تومان میباشد',
    );
  }

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'تنظیمات کاربر',
        subtitle: 'حریم شخصی و ارتقا و اقضایش اعتبار',
        leading: IconWidget(icon: Icons.person, color: Colors.blueGrey),
        child: SettingsScreen(
          title: 'تنظیمات کاربری',
          children: <Widget>[
            buildPrivacy(context),
            buildAccountInfo(context),
            buildpayment(context),
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
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const AccountDetail();
            },
          ));
        },
      );

  Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
        title: 'ارتقا حساب کاربری',
        subtitle: '',
        leading: IconWidget(
          icon: Icons.upgrade_rounded,
          color: Colors.blue,
        ),
        onTap: () {
          ShowToast();
        },
      );

  buildpayment(BuildContext context) => SimpleSettingsTile(
        title: 'افزایش اعتبار',
        subtitle: '',
        leading: IconWidget(
          icon: Icons.monetization_on_rounded,
          color: Colors.teal,
        ),
        onTap: () {
          showAlert();
        },
      );

  Widget buildPassword() => TextInputSettingsTile(
        settingKey: AccountPage.keyPassword,
        title: 'رمز ورود',
        obscureText: true,
        validator: (password) => password != null && password.length >= 6
            ? null
            : '!بیش از شش کارکتر وارد کن',
      );
  void ShowToast() => Fluttertoast.showToast(
    msg: 'ارتقاع یافت',
    fontSize: 18,
    backgroundColor: Colors.grey,
  );
}

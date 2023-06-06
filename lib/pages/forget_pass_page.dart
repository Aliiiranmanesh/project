import 'package:flutter/material.dart';
import 'package:project/components/my_textfield.dart';
import 'package:project/components/obscure_toggle_button.dart';
import 'package:project/pages/login_page.dart';

class ForgetPassPage extends StatelessWidget {
  const ForgetPassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.account_circle_outlined,
                size: 100,
              ),
              const SizedBox(height: 50),
              Text(
                'فراموشی رمز عبور',
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
              const SizedBox(height: 25),
              MyTextField(
                hintText: 'نام کاربری یا ایمیل',
                obscureText: false,
              ),

              const SizedBox(height: 25),

              //password textfield
              ObscureToggleButton(
                hintText: 'رمز عبور جدید',
                obscureText: true,
              ),
              const SizedBox(height: 60),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const LoginPage();
                        },
                      ));
                    },
                    child: const Text('تغییر رمز عبور',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

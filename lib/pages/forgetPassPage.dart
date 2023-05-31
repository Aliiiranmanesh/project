import 'package:flutter/material.dart';
import 'package:project/components/my_textfield.dart';
import 'package:project/pages/login_page.dart';

class ForgetPassPage extends StatelessWidget {
  ForgetPassPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final newPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 50),
              Icon(
                Icons.account_circle_outlined,
                size: 100,
              ),
              SizedBox(height: 50),
              Text(
                'فراموشی رمز عبور',
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: usernameController,
                hintText: 'نام کاربری یا ایمیل',
                obscureText: false,
              ),

              const SizedBox(height: 25),

              //password textfield
              MyTextField(
                controller: newPassword,
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
                        primary: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ));
                    },
                    child: Text('تغییر رمز عبور',
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

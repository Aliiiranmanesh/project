import 'package:flutter/material.dart';
import 'package:project/components/my_textfield.dart';
import 'package:project/pages/auth_page.dart';
import 'package:project/pages/forgetPassPage.dart';
import 'package:project/pages/registrationPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  //signUserIn
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 50),
                //welcome back!
                Text(
                  '!دلمون برات تنگ شده بود',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 25),

                //username textfield
                MyTextField(
                  hintText: 'نام کاربری یا ایمیل',
                  obscureText: false,
                ),

                const SizedBox(height: 25),

                //password textfield
                MyTextField(
                  hintText: 'رمز عبور',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return const ForgetPassPage();
                            },
                          ));
                        },
                        child: Text(
                          'رمزت رو فراموش کردی؟',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                //sign in button
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
                            return const SingInPage();
                          },
                        ));
                      },
                      child: const Text(
                        'ورود',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const RegistrationPage();
                          },
                        ));
                      },
                      child: const Text(
                        '!همین الان عضو شو',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'هنوز عضو نیستی؟',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

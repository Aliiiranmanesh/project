import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/components/my_textfield.dart';
import 'package:project/pages/home.dart';
import 'package:project/pages/forget_pass_page.dart';
import 'package:project/pages/registration_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //signUserIn
  authorize() async {
    String req = "Authorize\nUser:$userController,,Pass:$passController\u0000";
    await Socket.connect("10.0.2.2", 8000).then((serverSocket) {
      serverSocket.write(req);
      serverSocket.flush();
      serverSocket.listen((res) {
        print(String.fromCharCodes(res));
        setState(() {
          _log = String.fromCharCodes(res) + "\n";
        });
        if (!_log.contains("wrong")) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const home_page();
            },
          ));
        }
      });
    });
  }

  TextEditingController passController = TextEditingController();

  TextEditingController userController = TextEditingController();

  String _log = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  controller: userController,
                  hintText: 'نام کاربری',
                  obscureText: false,
                ),

                const SizedBox(height: 25),

                //password textfield
                MyTextField(
                  controller: passController,
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
                        onPressed: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return ForgetPassPage();
                            },
                          ));
                        }),
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
                        authorize();
                      },
                      child: const Text(
                        'ورود',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(_log,
                    style: TextStyle(
                      color: Colors.red,
                    )),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return RegistrationPage();
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

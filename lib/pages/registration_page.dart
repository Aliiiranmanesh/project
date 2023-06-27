import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/components/my_textfield.dart';
import 'package:project/components/obscure_toggle_button.dart';
import 'package:project/pages/login_page.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  register() async {
    String req = "register\nUser:$userController,,Pass:$passController,,Email:$emailController\u0000";
    await Socket.connect("10.0.2.2", 8000).then((serverSocket) {
      serverSocket.write(req);
      serverSocket.flush();
      serverSocket.listen((res) {
        print(String.fromCharCodes(res));
        setState(() {
          _log = String.fromCharCodes(res);
        });
        if (!_log.contains("already") ) {
          if(!_log.contains("Password or email"))
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return LoginPage();
            },
          ));
        }
      });
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
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
                const Icon(
                  Icons.person_add_alt_rounded,
                  size: 150,
                ),
                const SizedBox(height: 50),
                //welcome back!
                Center(
                  child: Text(
                    '!خوش آمدی به جمع کتاب خوان ها',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                    ),
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
                ObscureToggleButton(
                  controller: passController,
                  hintText: 'رمز عبور',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                MyTextField(
                  controller: emailController,
                  hintText: 'پست الکترونیکی',
                  obscureText: false,
                ),
                const SizedBox(height: 75),

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
                        register();
                      },
                      child: const Text(
                        'ثبت نام',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Text(_log,
                    style: TextStyle(
                      color: Colors.red,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/components/my_textfield.dart';
import 'package:project/components/obscure_toggle_button.dart';
import 'package:project/pages/login_page.dart';

class ForgetPassPage extends StatefulWidget {
  ForgetPassPage({Key? key}) : super(key: key);

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {

  TextEditingController userController = TextEditingController();

  TextEditingController newPassController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  NewPass() async {
    String req =
        "NewPass\nUser:$userController,,Pass:$newPassController,,Email:$emailController\u0000";
    await Socket.connect("10.0.2.2", 8000).then((serverSocket) {
      serverSocket.write(req);
      serverSocket.flush();
      serverSocket.listen((res) {
        print(String.fromCharCodes(res));
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ));
      });
    });
  }

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
                controller: userController,
                hintText: 'نام کاربری',
                obscureText: false,
              ),

              const SizedBox(height: 25),
              MyTextField(
                controller: emailController,
                hintText: 'ایمیل',
                obscureText: false,
              ),
              const SizedBox(height: 25),

              //password textfield
              ObscureToggleButton(
                controller: newPassController,
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
                      NewPass();
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

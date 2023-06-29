import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/components/obscure_toggle_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentPage extends StatefulWidget {
  final String amount;

  const PaymentPage({Key? key, required this.amount}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController passController = TextEditingController();
  TextEditingController userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 1.5),
            Container(
              height: 50,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                color: Colors.grey[300],
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  '${widget.amount}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            ObscureToggleButton(
                controller: passController,
                hintText: 'رمز کارت شما چهار رقم اخر شماره دانشجویی شماست',
                obscureText: true),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    addToWallet();
                  },
                  child: const Text(
                    'پرداخت',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addToWallet() async {
    String req =
        "addToWallet\nUser:$userController,,Money:${widget.amount}\u0000";
    await Socket.connect("10.0.2.2", 8000).then((serverSocket) {
      serverSocket.write(req);
      serverSocket.flush();
      serverSocket.listen((res) {
        print(String.fromCharCodes(res));
        ShowToast();
      });
    });
  }
}

void ShowToast() => Fluttertoast.showToast(
      msg: 'پرداخت موفق آمیز',
      fontSize: 18,
      backgroundColor: Colors.grey,
    );

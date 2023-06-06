import 'package:flutter/material.dart';
import 'package:project/pages/library.dart';
import 'package:project/pages/setting_page.dart';
import 'package:project/pages/store_page.dart';

class Detail_page extends StatefulWidget {
  const Detail_page({Key? key}) : super(key: key);

  @override
  State<Detail_page> createState() => _Detail_pageState();
}

class _Detail_pageState extends State<Detail_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 10),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    style: const ButtonStyle(),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

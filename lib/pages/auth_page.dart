import 'package:flutter/material.dart';

class SingInPage extends StatefulWidget {
  SingInPage({Key? key}) : super(key: key);

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            padding: EdgeInsets.all(20),
            alignment: Alignment.topLeft,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.grey[700],
        backgroundColor: Colors.black87,
        items: const [
          BottomNavigationBarItem(label: 'خانه', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'فروشگاه', icon: Icon(Icons.store_outlined)),
          BottomNavigationBarItem(label: 'تنظیمات', icon: Icon(Icons.settings)),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

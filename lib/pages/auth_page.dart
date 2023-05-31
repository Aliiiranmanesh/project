import 'package:flutter/material.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({Key? key}) : super(key: key);

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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

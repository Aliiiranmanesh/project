import 'package:flutter/material.dart';
import 'package:project/pages/Home_screen.dart';
import 'package:project/pages/library.dart';
import 'package:project/pages/setting_page.dart';
import 'package:project/pages/store_page.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> with TickerProviderStateMixin {
  int currentIndex = 0;
  final screens = [
    Home(),
    Library(),
    Store(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey[700],
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black87,
        items: const [
          BottomNavigationBarItem(
            label: 'خانه',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'کتابخانه',
            icon: Icon(Icons.library_books_rounded),
          ),
          BottomNavigationBarItem(
            label: 'فروشگاه',
            icon: Icon(Icons.store_outlined),
          ),
          BottomNavigationBarItem(
            label: 'تنظیمات',
            icon: Icon(Icons.settings),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: screens[currentIndex],
    );
  }
}

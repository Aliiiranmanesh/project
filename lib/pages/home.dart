import 'package:flutter/material.dart';
import 'package:project/pages/library.dart';
import 'package:project/pages/setting_page.dart';
import 'package:project/pages/store_page.dart';
import 'package:project/components/tab_bar.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  int currentIndex = 0;
  int tabIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavigationBar(
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
          switch(index){
            case 1:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const Library();
                },
              ));
              break;
            case 2:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const Store();
                },
              ));
              break;
            case 3:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const Setting();
                },
              ));

          }
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: Column(
        children: [
          TabBarr(tabIndex,(int index){
            setState(() {
              tabIndex = index;
            });
            pageController.jumpToPage(index);
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  style: const ButtonStyle(
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

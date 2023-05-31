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
      body: Row(
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
    );
  }
}

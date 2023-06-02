import 'package:flutter/material.dart';
import 'package:project/pages/library.dart';
import 'package:project/pages/setting_page.dart';
import 'package:project/pages/store_page.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  int currentIndex = 0;
  int tabIndex = 0;
  final pageController = PageController();
  String bookName = 'fight club';

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
          switch (index) {
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
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    width: 150,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                                "data:image/jpeg;base64,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"),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  bookName,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Creates border
                        color: Colors.black87),
                    tabs: [
                  Tab(text: 'کتاب ها'),
                  Tab(text: 'کتاب های صوتی'),
                ]),
            ],
          ),
        ),
      ),
    );
  }
}

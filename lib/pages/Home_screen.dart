import 'package:flutter/material.dart';
import 'package:project/pages/detail_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int tabIndex = 0;
  List images = [
    '1.jpg',
    '2.jpg',
    '3.jpg',
    '4.jpg',
    '6.jpg',
  ];
  final pageController = PageController();
  String bookName = 'fight club';

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const Detail_page();
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, bottom: 5),
                    width: 150,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('lib/Asset/fight club.jpg'),
                        )),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                bookName,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(fontSize: 16),
                unselectedLabelColor: Colors.grey[700],
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Creates border
                    color: Colors.black87),
                tabs: [
                  Tab(
                    text: 'کتاب ها',
                  ),
                  Tab(
                    text: 'کتاب های صوتی',
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height / 2 + 20,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView(children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'علاقه مندی ها',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5, right: 5),
                      height: MediaQuery.of(context).size.height / 3 + 20,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const Detail_page();
                                  },
                                ));
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 2 + 20,
                                width: MediaQuery.of(context).size.width - 20,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'lib/Asset/' + images[index]),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'تازه ها',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5, right: 5),
                      height: MediaQuery.of(context).size.height / 3 + 20,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const Detail_page();
                                  },
                                ));
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 2 + 20,
                                width: MediaQuery.of(context).size.width - 20,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'lib/Asset/' + images[index]),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'پرفروشترینها',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5, right: 5),
                      height: MediaQuery.of(context).size.height / 3 + 20,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const Detail_page();
                                  },
                                ));
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 2 + 20,
                                width: MediaQuery.of(context).size.width - 20,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'lib/Asset/' + images[index]),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ]),
                  ListView(children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'علاقه مندی ها',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5, right: 5),
                      height: MediaQuery.of(context).size.height / 3,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const Detail_page();
                                  },
                                ));
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 2 + 20,
                                width: MediaQuery.of(context).size.width - 20,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'lib/Asset/' + images[index]),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'تازه ها',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5, right: 5),
                      height: MediaQuery.of(context).size.height / 3 + 20,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const Detail_page();
                                  },
                                ));
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 2 + 20,
                                width: MediaQuery.of(context).size.width - 20,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'lib/Asset/' + images[index]),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'پرفروشترینها',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5, right: 5),
                      height: MediaQuery.of(context).size.height / 3 + 20,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const Detail_page();
                                  },
                                ));
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 2 + 20,
                                width: MediaQuery.of(context).size.width - 20,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'lib/Asset/' + images[index]),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

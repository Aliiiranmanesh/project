import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/pages/detail_page.dart';

import 'AudioPage.dart';

class Library extends StatefulWidget {
  Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  List images = [
    '1.jpg',
    '2.jpg',
    '3.jpg',
    '4.jpg',
    '5.jpg',
    '6.jpg',
  ];

  String? selectedItem = 'تاریخ خوانده شده';

  List<String> items = ['تاریخ خوانده شده', 'بیشترین پسند'];

  String setAsset(int index) {
    if (index <= 2) {
      return 'lib/Asset/Books/${index + 1}/${index + 1}.pdf';
    } else {
      return 'lib/Asset/AudioBooks/${index + 1}/${index + 1}.pdf';
    }
  }

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
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 10),
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15, top: 10),
                child: DropdownButton(
                  value: selectedItem,
                  items: items
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(fontSize: 24),
                              textAlign: TextAlign.end,
                            ),
                          ))
                      .toList(),
                  onChanged: ((item) => setState(() => selectedItem = item)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5, right: 5),
              height: MediaQuery.of(context).size.height - 100,
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () async {
                        if (index <= 2) {
                          final file = await PDFapi.loadAsset(setAsset(index));
                          openPDF(context, file);
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return AudioPage(name: "${(index + 1)}");
                            },
                          ));
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2 + 20,
                        width: MediaQuery.of(context).size.width - 20,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('lib/Asset/' + images[index]),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => Detail_page(file: file)));
}

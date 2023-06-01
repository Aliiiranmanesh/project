import 'package:flutter/material.dart';

class TabBarr extends StatelessWidget {
  final int selectedIndex;
  final Function callback;

  TabBarr(this.selectedIndex, this.callback, {Key? key}) : super(key: key);
  final tabs = ['Ebooks', 'Audiobooks'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 5),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => GestureDetector(
                onTap: () => callback(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  alignment: Alignment.center,
                  width: ((width - 40) / 2) - 8,
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                ),
              ),
          separatorBuilder: (_, index) => const SizedBox(width: 10),
          itemCount: tabs.length),
      width: width,
      height: 56,
    );
  }
}

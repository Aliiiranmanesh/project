import 'package:flutter/material.dart';
import 'package:project/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoJo',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

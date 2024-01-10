// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:newsapp/pages/news_page.dart';
import 'package:newsapp/services/news_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsPage(),
    );
  }
}

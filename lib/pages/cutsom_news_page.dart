// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:newsapp/widgets/category.dart';
import 'package:newsapp/widgets/news.dart';

class CustomNewsPage extends StatelessWidget {

  String categoryOption;

  CustomNewsPage({super.key, required this.categoryOption});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "News",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Cloud",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CategoryListView(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 26,
              ),
            ),
            NewsListViewBuilder(categoryOption: categoryOption),
          ],
        ),
      ),
    );
  }
}
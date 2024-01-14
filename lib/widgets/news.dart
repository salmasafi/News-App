// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_constructors_in_immutables, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:newsapp/objects/news_model.dart';
import 'package:newsapp/services/news_service.dart';

class NewsListViewBuilder extends StatefulWidget {
  String categoryOption;

  NewsListViewBuilder({
    super.key, required this.categoryOption
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {

var future;

@override
  void initState() {
    super.initState();
    future = NewsService().getNews(categoryOption: widget.categoryOption);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(newsList: snapshot.data!);
        } else if (snapshot.hasError) {
          return Center(
            child: Text('OOPS There is a problem'),
          );
        } else {
          return SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

class NewsListView extends StatelessWidget {
  List<NewsModel> newsList;
  NewsListView({super.key, required this.newsList});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return NewsCard(
            news: newsList[index],
          );
        },
        childCount: newsList.length,
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  NewsModel news;
  NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(news.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          news.title,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black87),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          news.subtitle,
          style: TextStyle(fontSize: 14, color: Colors.grey),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 22,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';

class ArticlePage extends StatelessWidget {
  Article? article;
  ArticlePage({this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article!.title!)),
      body: Center(
        child: Text(article!.description!),
      ),
    );
  }
}

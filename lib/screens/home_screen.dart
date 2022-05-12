import 'package:flutter/material.dart';
import 'package:newsapp/screens/article_screen.dart';
import 'package:newsapp/services/api_services.dart';
import 'package:newsapp/widget/customListTile.dart';

import '../models/article_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News App ',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> article = snapshot.data!;
            return ListView.builder(
              itemCount: article.length,
              itemBuilder: (context, index) {
                // return customListTile(article[index]);
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ArticlePage(article: article[index])),
                    );
                  },
                  child: CardTile(
                    urlImage: article[index].urlToImage,
                    source: article[index].source!.name,
                    title: article[index].title,
                  ),
                );
              },
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Please check your Internet connection"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

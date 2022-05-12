import 'dart:convert';
import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final endPoint =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=99ffe2d4a17f406a8c8428b3f4b180af";

  Future<List<Article>> getArticle() async {
    http.Response response = await http.get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromjson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articel");
    }
  }
}

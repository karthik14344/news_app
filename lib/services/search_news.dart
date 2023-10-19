import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/aticle_model.dart';

Future<List<ArticleModel>> searchNews(String query) async {
  String url =
      "https://newsapi.org/v2/everything?q=$query&from=2023-10-17&to=2023-10-17&sortBy=popularity&apiKey=1065c5f7be7e4ba3a07f3688cb9b289b";
  var response = await http.get(Uri.parse(url));

  var jsonData = jsonDecode(response.body);

  List<ArticleModel> searchResults = [];

  if (jsonData['status'] == 'ok') {
    jsonData["articles"].forEach((element) {
      if (element["urlToImage"] != null && element["description"] != null) {
        ArticleModel articleModel = ArticleModel(
          title: element["title"],
          description: element["description"],
          url: element["url"],
          urlToImage: element["urlToImage"],
          content: element["content"],
          author: element["author"],
        );
        searchResults.add(articleModel);
      }
    });
  }

  return searchResults;
}

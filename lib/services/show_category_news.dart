// https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=1065c5f7be7e4ba3a07f3688cb9b289b
import 'dart:convert';

import 'package:news_app/models/show_category_model.dart';

import '../models/slider_model.dart';
import 'package:http/http.dart' as http;

class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];

  Future<void> getCategoryNews(String id) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=$id&category=business&apiKey=1065c5f7be7e4ba3a07f3688cb9b289b";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ShowCategoryModel categoryModel = ShowCategoryModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          categories.add(categoryModel);
        }
      });
    }
  }
}

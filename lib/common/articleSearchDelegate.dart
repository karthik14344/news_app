import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/search_news.dart';
import '../models/aticle_model.dart';
import '../pages/homepage.dart';

class ArticleSearchDelegate extends SearchDelegate<String> {
  final List<ArticleModel> articles;

  ArticleSearchDelegate(this.articles);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: searchNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<ArticleModel> searchResults =
              snapshot.data as List<ArticleModel>;
          return ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return BlogTile(
                desc: searchResults[index].description!,
                imageUrl: searchResults[index].urlToImage!,
                title: searchResults[index].title!,
                url: searchResults[index].url!,
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        if (articles[index]
            .title!
            .toLowerCase()
            .contains(query.toLowerCase())) {
          return ListTile(
            title: Text(
              articles[index].title!,
              maxLines: 2,
            ),
            leading: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: articles[index].urlToImage!,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {
              query = articles[index].title!;
              showResults(context);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}

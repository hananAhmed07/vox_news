import 'article.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<Article>? articles;

  NewsResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  NewsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];

    if (json['articles'] != null) {
      articles = <Article>[];

      for (var article in json['articles']) {
        articles!.add(
          Article.fromJson(article),
        );
      }
    }
  }
}
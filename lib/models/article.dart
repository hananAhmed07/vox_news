class Article {
  SourceInfo? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null
        ? SourceInfo.fromJson(json['source'])
        : null;

    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}

class SourceInfo {
  String? id;
  String? name;

  SourceInfo({
    this.id,
    this.name,
  });

  SourceInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
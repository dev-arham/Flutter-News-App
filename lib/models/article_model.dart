import 'source_model.dart';

class NewsResponseModel {
  String? status;
  int? totalResults;
  List<Article>? articles;

  NewsResponseModel({this.status, this.totalResults, this.articles});

  NewsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Article>[];
      json['articles'].forEach((article) {
        articles!.add(Article.fromJson(article));
      });
    }
  }
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Article.fromJson(Map<String, dynamic> json) {
    source =
        json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'] as String;
  }
}

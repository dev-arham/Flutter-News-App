import 'dart:convert';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
import '../env.dart';

class ApiService {
  static const String baseUrl = 'https://newsapi.org/v2';

  Future<NewsResponseModel> getArticle() async {
    var url =
        Uri.parse('$baseUrl/top-headlines?sources=bbc-news&apiKey=$apiKey');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return NewsResponseModel.fromJson(json);
    } else {
      throw Exception('Failed to load article');
    }
  }

  Future<NewsResponseModel> getArticleBySearch({String query="usa"}) async {
    var url =
        Uri.parse('$baseUrl/everything?q=$query&apiKey=$apiKey');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return NewsResponseModel.fromJson(json);
    } else {
      throw Exception('Failed to load article');
    }
  }
}

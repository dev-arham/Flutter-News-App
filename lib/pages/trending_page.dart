import 'package:flutter/material.dart';
import '../components/custom_news_tile.dart';
import '../models/article_model.dart';
import '../services/api_service.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService userService = ApiService();
    return SafeArea(
      child: FutureBuilder(
          future: userService.getArticle(),
          builder: (context, AsyncSnapshot<NewsResponseModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return const Center(child: Text('Error'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.articles?.length,
                itemBuilder: (context, index) {
                  return customNewsTile(context,
                      article: snapshot.data?.articles?[index]);
                },
              );
            }
          }),
    );
  }
}

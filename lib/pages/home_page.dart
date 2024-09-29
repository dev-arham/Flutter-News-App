import 'package:flutter/material.dart';
import 'package:news_app/components/custom_news_tile.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService userService = ApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
            future: userService.getArticle(),
            builder: (context, AsyncSnapshot<NewsResponseModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
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

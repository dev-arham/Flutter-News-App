import 'package:flutter/material.dart';
import '../components/custom_news_tile.dart';
import '../models/article_model.dart';
import '../services/api_service.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  TextEditingController searchBarController = TextEditingController();
  String query = "usa";
  ApiService userService = ApiService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchBarController,
                    decoration: const InputDecoration(
                      hintText: "Search",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        query = searchBarController.text;
                        searchBarController.clear();
                      });
                    },
                    icon: const Icon(
                      Icons.search_outlined,
                      color: Colors.blue,
                    )),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
        future: userService.getArticleBySearch(query: query),
        builder: (context, AsyncSnapshot<NewsResponseModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.articles?.length,
              itemBuilder: (context, index) {
                return customNewsTile(context,article: snapshot.data?.articles?[index]);
              },
            );
          }
        })
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/article_model.dart';
import '../pages/news_detail_page.dart';

Widget customNewsTile(context, {required Article? article}) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsDetailPage(article: article),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article?.urlToImage ?? ""),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            article?.title ?? "No Title",
            style: const TextStyle(
              fontFamily: "inter",
              fontSize: 16,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              article?.source?.name ?? "",
              style: const TextStyle(
                  fontFamily: "inter", fontSize: 14, color: Colors.white),
            ),
          ),
          Text(
            article?.author ?? "Random Author",
            style: const TextStyle(
              fontFamily: "inter",
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/article_model.dart';

class NewsDetailPage extends StatelessWidget {
  final Article? article;
  const NewsDetailPage({super.key, required this.article});

  Future<void> _launchUrl(Uri url) async {
    try {
      await launchUrl(url);
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article?.title ?? "No Title"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
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
              article?.title ?? "No Title",
              style: const TextStyle(
                fontFamily: "inter",
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              article?.description ?? "No Description",
              style: const TextStyle(
                fontFamily: "inter",
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // Show truncated content with Read More link
            Text(
              article?.content?.split("[+")[0] ?? "Content not available.",
              style: const TextStyle(
                fontFamily: "inter",
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                _launchUrl(Uri.parse(article?.url ?? ""));
              },
              child: const Text("Read More"),
            ),
          ],
        ),
      ),
    );
  }
}

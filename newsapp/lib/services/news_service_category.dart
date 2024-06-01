import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/news_model.dart';

class NewsService {
  Future<List<News>> getNews({required String category}) async {
    const String apiKey = "6a0b99ed60b04250bc34a30c323c58b1";
    const String baseUrl = "https://newsapi.org/v2/top-headlines";
    final url = "$baseUrl?country=us&category=$category&apiKey=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return Future.error("Error: ${response.statusCode}");
    } else {
      final data = jsonDecode(response.body);
      final articles = (data['articles'] as List)
          .map((article) => News.fromJson(article))
          .where((article) =>
              article.urlToImage != null &&
              article.urlToImage.isNotEmpty &&
              article.description != null &&
              article.description.isNotEmpty)
          .toList();
      return articles;
    }
  }
}



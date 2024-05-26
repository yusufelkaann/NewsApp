

import '../models/news_model.dart';
import 'package:dio/dio.dart';

class NewsService {
  final String apiKey = "6a0b99ed60b04250bc34a30c323c58b1";
  final String baseUrl = "https://newsapi.org/v2/top-headlines";

  Future<List<News>> getNews({required String category}) async {
    final dio = Dio();
    final url = "$baseUrl?category=$category&apiKey=$apiKey";

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        final List articles = data['articles'];
        return articles.map((json) => News.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load news");
      }
    } catch (e) {
      print(e);
      return Future.error("An error has occurred!");
    }
  }
}

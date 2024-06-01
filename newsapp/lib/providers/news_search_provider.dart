import 'package:flutter/material.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/services/news_service_everything.dart';

class SearchProvider extends ChangeNotifier {
  final NewsServiceEverything _newsService = NewsServiceEverything();
  List<News> _allNews = []; 
  List<News> _filteredNews = []; 

  
  void setNews(List<News> news) {
    _allNews = news;
    _filteredNews = List.from(news); 
    notifyListeners();
  }

  List<News> get filteredNews => _filteredNews;

 
  void search(String query) async {
    if (query.isEmpty) {
      
      _filteredNews = List.from(_allNews);
    } else {
      try {
        
        final List<News> news = await _newsService.getNews(search: query);
        
        _filteredNews = news
            .where((article) =>
                article.urlToImage.isNotEmpty &&
                article.description.isNotEmpty)
            .toList();
      } catch (e) {
        
        print("Error fetching news: $e");
        _filteredNews = []; 
      }
    }
    notifyListeners();
  }
}

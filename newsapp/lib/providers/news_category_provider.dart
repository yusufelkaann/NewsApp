import 'package:flutter/foundation.dart';
import '../models/news_model.dart';
import '../services/news_service_category.dart';

class NewsProvider with ChangeNotifier {
  final NewsService _newsService = NewsService();
  List<News> _articles = [];
  String _selectedCategory = 'general';
  String? _errorMessage;

  List<News> get articles => _articles;

  String get selectedCategory => _selectedCategory;

  String? get errorMessage => _errorMessage;

  // Define categories property
  final List<String> _categories = [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology'
  ];

  List<String> get categories => _categories;

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    fetchNews();
    notifyListeners();
  }

  Future<void> fetchNews() async {
    try {
      _errorMessage = null; // Reset the error message
      _articles = await _newsService.getNews(category: _selectedCategory);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching news: $e");
      }
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}

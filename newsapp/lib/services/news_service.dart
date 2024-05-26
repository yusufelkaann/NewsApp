import '../models/news_model.dart';
import 'package:dio/dio.dart';

class NewsService{
  Future<List<News>> getNews() async{
    const apiKey = "6a0b99ed60b04250bc34a30c323c58b1";
    const BASE_URL = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=$apiKey";
    
    final dio = Dio();
    final response = await dio.get(BASE_URL);

    if (response.statusCode != 200){
      return Future.error("An error has occured!"); 
    }

    final List list = response.data;
    final List<News> newsList = list.map((e) => News.fromJson(e)).toList(); 
    
    return newsList;
  
  }
}
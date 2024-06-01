import 'package:flutter/material.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/pages/news_detail_page.dart';

class NewsCard extends StatelessWidget {
  final News news;

  NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageHeight = screenWidth * 0.5; 

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailPage(news: news),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.background,
          
          
        ),
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.urlToImage.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  news.urlToImage,
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: screenWidth * 0.05, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  if (news.publishedAt != null)
                    Text(
                      news.publishedAt,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: screenWidth * 0.03, 
                      ),
                    ),
                  SizedBox(height: 8),
                  if (news.description != null && news.description.isNotEmpty)
                    Text(
                      news.description,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: screenWidth * 0.04, 
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newsapp/components/custom_navigation_bar.dart';
import 'package:newsapp/models/news_model.dart';




class NewsDetailPage extends StatelessWidget {
  final News news;

  NewsDetailPage({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Center(
          child: Text('News', ),
        ),
        automaticallyImplyLeading: false, 
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(news.urlToImage),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    news.title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Published at: ${news.publishedAt}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    news.content,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget _buildImage(String? imageUrl) {
    return AspectRatio(
      aspectRatio: 16 / 9, 
      child: ClipRRect(
        child: imageUrl != null && imageUrl.isNotEmpty
            ? Image.network(
                imageUrl,
                fit: BoxFit.cover, 
              )
            : Container(
                color: Colors.grey,
                child: Icon(Icons.image, color: Colors.white),
              ),
      ),
    );
  }
}


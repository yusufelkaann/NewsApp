// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:newsapp/components/custom_navigation_bar.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/pages/news_detail_page.dart';

import 'package:newsapp/providers/news_category_provider.dart';

import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../components/news_card.dart';
import '../components/category_tile.dart'; 


class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        
        title: Center(child: Text('News',)),
        automaticallyImplyLeading: false, 
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newsProvider.categories.length,
              itemBuilder: (context, index) {
                final category = newsProvider.categories[index];
                return CategoryTile(
                  category: category,
                  isSelected: category == newsProvider.selectedCategory,
                  onTap: () {
                    newsProvider.setSelectedCategory(category);
                  },
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 250,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      autoPlay: true,
                    ),
                    items: newsProvider.articles
                      .take(3)
                      .map((news) => BuildCarouselItem(news))
                      .toList(),
                  ),
                  //SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(top:16, left: 8),
                    child: Align(
                      
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Latest news!", 
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.tertiary,),),
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: newsProvider.articles.length,
                    itemBuilder: (context, index) {
                      final news = newsProvider.articles[index];
                      return NewsCard(news: news);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),

    );
  }

  Widget BuildCarouselItem( News news) => GestureDetector(
    onTap: () {
      Navigator.push(
        context,
          MaterialPageRoute(
            builder: (context) => NewsDetailPage(news: news),
          ),
      );
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              news.urlToImage,
              height: 250,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            height: 250,
            padding: EdgeInsets.only(left: 10.0),
            margin: EdgeInsets.only(top: 170),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),
            child: Text(
              news.title,
              style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}

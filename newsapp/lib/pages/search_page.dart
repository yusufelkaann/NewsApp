// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newsapp/components/custom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/providers/news_search_provider.dart';
import 'package:newsapp/components/news_card.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Search',)),
        automaticallyImplyLeading: false, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.tertiary,
                  )
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.background,
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                Provider.of<SearchProvider>(context, listen: false).search(query);
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: Consumer<SearchProvider>(
                builder: (context, searchProvider, _) {
                  final searchResults = searchProvider.filteredNews;

                  if (searchResults.isEmpty) {
                    return Center(child: Text("No news found"));
                  }

                  return ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      return NewsCard(news: searchResults[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar()
    );
  }
}

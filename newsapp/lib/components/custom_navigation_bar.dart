// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:newsapp/pages/news_page.dart';
import 'package:newsapp/pages/search_page.dart';
import 'package:newsapp/providers/bottomnavbar_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(
      builder: (context, bottomNavBarProvider, _) {
        return BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          currentIndex: bottomNavBarProvider.currentIndex,
          onTap: (index) => _handleTabChange(context, index),
          unselectedItemColor: Theme.of(context).colorScheme.tertiary,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          
          
          items: [
            BottomNavigationBarItem(
              
              icon: Icon(Icons.home, color: Theme.of(context).colorScheme.tertiary,),
              label: "Home",
              
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Theme.of(context).colorScheme.tertiary,),
              label: "Search",
              
            ),
          ],
        );
      },
    );
  }

  void _handleTabChange(BuildContext context, int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchPage()),
      );
    } else {
      Provider.of<BottomNavBarProvider>(context, listen: false).setCurrentIndex(index);
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => NewsScreen())
          );
    }
  }
}

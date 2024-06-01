import 'package:flutter/material.dart';
import 'package:newsapp/themes/app_theme.dart';
import 'package:provider/provider.dart';
import '../providers/news_category_provider.dart';
import '../providers/news_search_provider.dart';
import '../pages/news_page.dart';
import '../providers/bottomnavbar_provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: AppTheme,
        home: NewsScreen(),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int _currentIndex = 0;
  bool _showBottomNavigationBar = true;

  int get currentIndex => _currentIndex;
  bool get showBottomNavigationBar => _showBottomNavigationBar;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setShowBottomNavigationBar(bool show) {
    _showBottomNavigationBar = show;
    notifyListeners();
  }
}

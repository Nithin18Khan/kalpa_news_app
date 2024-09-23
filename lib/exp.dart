import 'package:flutter/material.dart';
import 'package:kalpas_news_app/model/screen/catagories_screen.dart';
import 'package:kalpas_news_app/model/screen/profile_screen.dart';
import 'package:kalpas_news_app/model/screen/search_screen.dart';
import 'package:kalpas_news_app/news_screen.dart';

class ScafoldScreen extends StatefulWidget {
  @override
  _ScafoldScreenState createState() => _ScafoldScreenState();
}

class _ScafoldScreenState extends State<ScafoldScreen> {
  int _currentIndex = 0;

  // List of screens for each tab
  final List<Widget> _screens = [
    NewsScreen(),
    SearchScreen(),
    CategoriesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalpa Top Headlines'),
      ),
      body: IndexedStack(
        index: _currentIndex,  // Use _currentIndex to control which screen is shown
        children: _screens,    // Show the respective screen
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,  // Highlight the active tab
        onTap: (index) {
          setState(() {
            _currentIndex = index;  // Change the active tab
          });
        },
      ),
    );
  }
}

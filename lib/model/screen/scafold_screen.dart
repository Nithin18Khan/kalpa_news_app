





import 'package:flutter/material.dart';

class ScafoldScreen extends StatefulWidget {
  @override
  _ScafoldScreenState createState() => _ScafoldScreenState();
}

class _ScafoldScreenState extends State<ScafoldScreen> {
  int _currentIndex = 0;

  final List<String> _routes = ['/newscreen', '/search', '/categories', '/profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalpa Top Headlines'),
      ),
      body: Center(
        child: Text('News Screen Content'),
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
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Navigate to selected screen
          Navigator.pushNamed(context, _routes[index]);
        },
      ),
    );
  }
}







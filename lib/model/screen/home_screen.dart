import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpas_news_app/model/screen/catagories_screen.dart';
import 'package:kalpas_news_app/model/screen/profile_screen.dart';
import 'package:kalpas_news_app/model/screen/search_screen.dart';
import 'package:kalpas_news_app/news_screen.dart';
import 'package:kalpas_news_app/repo/bottom_bar_provider.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final currentIndex = ref.watch(bottomNavProvider);

    // List of Screens 
    final List<Widget> screens = [
      NewsScreen(),   
      SearchScreen(), 
      CategoriesScreen(), 
      ProfileScreen(),   
    ];

    return Scaffold(
      body: IndexedStack(  
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
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
        currentIndex: currentIndex,
        onTap: (index) {
          
          ref.read(bottomNavProvider.notifier).changeIndex(index);
        },
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        elevation: 8.0,
      ),
    );
  }
}

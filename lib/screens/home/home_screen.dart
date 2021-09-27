import 'package:dog_app/screens/account/account_screen.dart';
import 'package:dog_app/screens/favourites/favourites_screen.dart';
import 'package:dog_app/screens/home/bottom_nav.dart';
import 'package:dog_app/screens/home/breed_list.dart';
import 'package:dog_app/screens/home/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _pages = [
    {
      'page': const BreedList(),
      'title': 'Home'
    },
    {
      'page': const FavouritesScreen(),
      'title': 'Favourites'
    },
    {
      'page': const AccountScreen(),
      'title': 'Account'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_currentIndex]['title'] as String,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
            tooltip: 'Sort',
          )
        ],
      ),
      body: _pages[_currentIndex]['page'] as Widget,
      drawer: const AppDrawer(),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }
}

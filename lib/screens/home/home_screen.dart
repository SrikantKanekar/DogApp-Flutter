import 'package:dog_app/provider/breeds.dart';
import 'package:dog_app/screens/account/account_screen.dart';
import 'package:dog_app/screens/favourites/favourites_screen.dart';
import 'package:dog_app/screens/home/bottom_nav.dart';
import 'package:dog_app/screens/home/breed_list.dart';
import 'package:dog_app/screens/home/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool ascending = true;

  final _pages = [
    {'page': const BreedList(), 'title': 'Home'},
    {'page': const FavouritesScreen(), 'title': 'Favourites'},
    {'page': const AccountScreen(), 'title': 'Account'},
  ];

  @override
  Widget build(BuildContext context) {
    var breeds = Provider.of<Breeds>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_currentIndex]['title'] as String,
        ),
        actions: [
          _pages[_currentIndex]['title'] == 'Home'
              ? IconButton(
                  icon: const Icon(Icons.sort),
                  tooltip: 'Sort',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Sort'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: const Text("Ascending"),
                              leading: Radio(
                                value: true,
                                groupValue: ascending,
                                onChanged: (value) {
                                  breeds.reverse();
                                  ascending = true;
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text("Descending"),
                              leading: Radio(
                                value: false,
                                groupValue: ascending,
                                onChanged: (value) {
                                  breeds.reverse();
                                  ascending = false;
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Container()
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

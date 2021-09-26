import 'package:dog_app/screens/home/bottom_nav.dart';
import 'package:dog_app/screens/home/breed_card.dart';
import 'package:dog_app/screens/home/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return const BreedCard(
            key: ValueKey('id'),
          );
        },
      ),
      drawer: const AppDrawer(),
      bottomNavigationBar: const AppBottomNav()
    );
  }
}

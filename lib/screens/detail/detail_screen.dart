import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Center(child: Text('id: $id')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.favorite_outline),
        onPressed: () {},
        tooltip: 'Add to Favourites',
      ),
    );
  }
}

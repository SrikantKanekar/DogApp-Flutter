import 'package:flutter/material.dart';

class BreedCard extends StatelessWidget {
  const BreedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: CircleAvatar(
        radius: 35,
      ),
      title: Text('Breed name'),
    );
  }
}

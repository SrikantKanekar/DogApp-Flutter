import 'package:dog_app/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';

class BreedCard extends StatelessWidget {
  final int id;

  const BreedCard({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      leading: const CircleAvatar(
        radius: 35,
      ),
      title: Text('Breed name $id'),
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailScreen.routeName,
          arguments: id,
        );
      },
    );
  }
}

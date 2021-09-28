import 'package:dog_app/provider/breeds.dart';
import 'package:dog_app/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreedCard extends StatelessWidget {
  final String name;

  const BreedCard({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var breeds = Provider.of<Breeds>(context);
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      leading: FutureBuilder(
        future: breeds.getImageLink(name),
        builder: (ctx,AsyncSnapshot<String> snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const CircleAvatar(radius: 35)
                : CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(snapshot.data ?? ''),
                  ),
      ),
      title: Text(name),
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailScreen.routeName,
          arguments: name,
        );
      },
    );
  }
}

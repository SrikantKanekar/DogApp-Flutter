import 'package:dog_app/provider/auth.dart';
import 'package:dog_app/provider/breeds.dart';
import 'package:dog_app/screens/home/breed_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<Auth>(context);
    var fav = auth.getUser!.favourites;
    return ListView.builder(
      itemBuilder: (ctx, i) {
        return BreedCard(
          key: ValueKey(i),
          name: fav[i],
        );
      },
      itemCount: fav.length,
    );
  }
}

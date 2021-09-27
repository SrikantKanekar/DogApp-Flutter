import 'package:flutter/material.dart';

import 'breed_card.dart';

class BreedList extends StatelessWidget {
  const BreedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        return BreedCard(
          key: ValueKey(i),
          id: i,
        );
      },
      itemCount: 10,
    );
  }
}

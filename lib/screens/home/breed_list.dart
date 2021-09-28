import 'package:dog_app/provider/breeds.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'breed_card.dart';

class BreedList extends StatefulWidget {
  const BreedList({Key? key}) : super(key: key);

  @override
  State<BreedList> createState() => _BreedListState();
}

class _BreedListState extends State<BreedList> {
  var _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Breeds>(context).fetchBreeds().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    var breeds = Provider.of<Breeds>(context);
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemBuilder: (ctx, i) {
              return BreedCard(
                key: ValueKey(i),
                name: breeds.items.elementAt(i).key,
              );
            },
            itemCount: breeds.items.length,
          );
  }
}

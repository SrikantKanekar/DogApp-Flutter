import 'package:dog_app/provider/breeds.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/detail';

  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late String name;
  late List<String> images;
  var _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      name = ModalRoute.of(context)!.settings.arguments as String;
      setState(() {
        _isLoading = true;
      });
      Provider.of<Breeds>(context).getImages(name).then((list) {
        setState(() {
          images = list;
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: _isLoading
            ? const CircularProgressIndicator()
            : GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: images.length,
                itemBuilder: (ctx, i) => GridTile(
                  child: Image.network(images[i], fit: BoxFit.cover,),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
              ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.favorite_outline),
        onPressed: () {},
        tooltip: 'Add to Favourites',
      ),
    );
  }
}

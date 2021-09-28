import 'dart:collection';
import 'dart:convert';

import 'package:dog_app/model/breed.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Breeds with ChangeNotifier {
  final HashMap<String, Breed> _items;

  Breeds(this._items);

  HashMap<String, Breed> get items {
    return _items;
  }

  Future<void> fetchBreeds() async {
    var url = Uri.parse('https://dog.ceo/api/breeds/list/all');
    final response = await http.get(url);
    final data = json.decode(response.body) as Map<String, dynamic>?;
    if (data == null) {
      return;
    }

    LinkedHashMap<String, dynamic> theParsedOne = data['message'];
    HashMap<String, Breed> newMap = HashMap.from(
      theParsedOne.map((key, value) {
        Breed breed = Breed(subBreed: List.from(value));
        return MapEntry(key, breed);
      }),
    );
    _items.addAll(newMap);
    notifyListeners();
  }

  Future<String> getImageLink(String name) async {
    var url = Uri.parse('https://dog.ceo/api/breed/$name/images/random');
    final response = await http.get(url);
    final data = json.decode(response.body);
    return data!['message'];
  }

  Future<List<String>> getImages(String name) async {
    var url = Uri.parse('https://dog.ceo/api/breed/hound/images/random/10');
    final response = await http.get(url);
    final data = json.decode(response.body)['message'] as List<dynamic>;
    final List<String> list = [];
    data.forEach((element) {
      list.add(element.toString());
    });
    return list;
  }
}
import 'package:flutter/material.dart';

class Item {
  final AssetImage placeImage;
  final String title;
  final String description;

  Item({
  required this.placeImage,
  required this.title,
  required this.description,
});
}

List<Item> items = [
  Item(
    placeImage: AssetImage('images/bg_02.png'),
    title: 'Nova York',
    description: '',
  ),
];

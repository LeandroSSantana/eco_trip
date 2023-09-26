import 'package:flutter/material.dart';

class Category {
  final String label;
  final IconData icon;
  final Color iconColor;

  Category({
    required this.label,
    required this.icon,
    required this.iconColor,
  });
}

final List<Category> categories = [
  Category(label: '1', icon: Icons.face, iconColor: Colors.black),
  Category(label: '1', icon: Icons.face, iconColor: Colors.black)
];

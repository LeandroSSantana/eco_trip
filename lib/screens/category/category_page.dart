// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;

  CategoryPage({
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0047AB),
        title: Text(
          categoryName,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFF0047AB),
              child: Icon(
                Icons.category,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Bem-vindo à categoria $categoryName',
              style: TextStyle(
                color: Color(0xFF0047AB),
                fontFamily: 'Lato_light',
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
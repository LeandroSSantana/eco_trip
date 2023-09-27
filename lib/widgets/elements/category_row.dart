// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste_telas/screens/category/category_page.dart';

Widget buildCategoryRow(
    BuildContext context, String label, IconData iconData) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CategoryPage(
            categoryName: label,
          ),
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFF0047AB),
            child: FaIcon(
              iconData,
              size: 35,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Lato_light',
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}

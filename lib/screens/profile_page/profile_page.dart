// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste_telas/data/perfil_data.dart';
import 'package:teste_telas/model/places/places.dart';
import 'package:teste_telas/widgets/elements/category_row.dart';
import 'package:teste_telas/widgets/featured_memories/featured_memories.dart';
import 'package:teste_telas/widgets/featured_places.dart';
import 'package:teste_telas/widgets/header/header_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdcdcdc),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            headerProfilePage(context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 280, 0, 5),
                  child: Text(
                    'Categorias',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto-Light',
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    buildCategoryRow(
                        context, 'Pinterest', FontAwesomeIcons.pinterest),
                    buildCategoryRow(
                        context, 'Facebook', FontAwesomeIcons.facebook),
                    buildCategoryRow(
                        context, 'Instagram', FontAwesomeIcons.instagram),
                    buildCategoryRow(
                        context, 'Whatsapp', FontAwesomeIcons.whatsapp),
                    buildCategoryRow(
                        context, 'Twitter', FontAwesomeIcons.twitter),
                    buildCategoryRow(
                        context, 'Snapchat', FontAwesomeIcons.snapchat),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 15, 0, 10),
                  child: Text(
                    'Lugares em Destaque',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto-light',
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: fPlaces.map((place) {
                      return FeaturedPlaces(places: place);
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 15, 0, 10),
                  child: Text(
                    'Lembranças em Destaque',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto-Light',
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        squareRowWidget('Cuba 1', 'images/cuba.png', 'cuba 2','images/cuba.png'),
                        SizedBox(height: 30),
                        squareRowWidget('Cuba 2', 'images/cuba.png', 'cuba 4','images/cuba.png')
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

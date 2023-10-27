// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_telas/model/places/places.dart';
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
        child: Column(
          children: [
            Stack(
              children: [
                headerProfilePage(context),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 300, 0, 10),
                      child: Text(
                        'Suas Viagens',
                        style: TextStyle(
                          color: Color(0xFF0047AB),
                          fontFamily: 'Roboto-light',
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
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
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/dashboard_page');
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF0047AB),
      ),
    );
  }
}

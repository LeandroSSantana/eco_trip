// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:teste_telas/model/places/places.dart';
import 'package:teste_telas/widgets/featured_places.dart';
import 'package:teste_telas/widgets/header/header_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();

  Widget customButton(BuildContext context, String text, String route) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF0047AB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdcdcdc),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                headerPage(context),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 270, 0, 10),
                      child: Text(
                        'Minhas Viagens',
                        style: TextStyle(
                          color: Color(0xFF0047AB),
                          fontFamily: 'Roboto-light',
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FeaturedPlaces(places: fPlaces[0]),
                            FeaturedPlaces(places: fPlaces[1]),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FeaturedPlaces(places: fPlaces[2]),
                            FeaturedPlaces(places: fPlaces[3]),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child:
                      customButton(context, 'Salvar', '/save_travel_page'),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: customButton(context, 'Calcular', '/travel_filter_page'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:teste_telas/data/perfil_data.dart';
import 'package:teste_telas/model/places/places.dart';
import 'package:teste_telas/screens/dashboard/dashboard_page.dart';
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
                            squareRowWidget('Cuba 1', 'images/cuba.png',
                                'cuba 2', 'images/cuba.png'),
                            SizedBox(height: 30),
                            squareRowWidget('Cuba 2', 'images/cuba.png',
                                'cuba 4', 'images/cuba.png'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DashboardPage(),
                  ),
                );
              },
              child: Text('Meu Botão'),
            ),
          ],
        ),
      ),
    );
  }
}

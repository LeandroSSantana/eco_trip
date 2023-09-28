// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste_telas/model/item/data.dart';
import 'package:teste_telas/widgets/elements/category_row.dart';
import 'package:teste_telas/widgets/featured_memories/featured_memories.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdcdcdc),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ClipRRect(
                    child: Image.network(
                      items[0].imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    // color: Colors.black.withOpacity(0.7),
                    child: Text(
                      'Miami',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontFamily: 'Roboto-Regular',
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCategoryRow( context, 'Alimentação', FontAwesomeIcons.bowlFood,),
                  buildCategoryRow( context, 'Passeios', FontAwesomeIcons.bus,),
                  buildCategoryRow( context, 'Cultura', FontAwesomeIcons.museum,),
                  buildCategoryRow( context, 'Bares', FontAwesomeIcons.glassMartini,),
                  buildCategoryRow( context, 'Esportes', FontAwesomeIcons.soccerBall,),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 15, 0, 10),
              child: Text(
                'Destaques em Miami',
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
                    squareRowWidget('Bares', 'images/miami1.png',
                        'Miami \npor cima', 'images/miami2.png'),
                    SizedBox(height: 30),
                    squareRowWidget('Passeios', 'images/miami3.png',
                        'Cultura', 'images/cuba.png'),
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

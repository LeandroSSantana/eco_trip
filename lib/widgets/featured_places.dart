// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:teste_telas/model/places/places.dart';
import 'package:teste_telas/screens/featured_places/featured_places_page.dart';

class FeaturedPlaces extends StatelessWidget {
  final Places places;

  FeaturedPlaces({
    required this.places,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FeaturedPlacesPage(places: places),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Color(0xFF0047AB)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    places.placeImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 18.0,
                  ),
                ),
              ),

              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                        size: 18.0,
                      ),
                      SizedBox(width: 2),
                      Text(
                        '${places.rating.toStringAsFixed(1)}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      places.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:teste_telas/model/places/places.dart';

class FeaturedPlacesPage extends StatelessWidget {
  final Places places;

  FeaturedPlacesPage({required this.places});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.25, // 25% da tela a partir do topo
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                places.placeImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    places.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    places.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Days: ${places.days}', // Exibir os dias
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Budget: \$${places.budget.toStringAsFixed(2)}', // Exibir o orçamento
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                        size: 18.0,
                      ),
                      SizedBox(width: 2),
                      Text(
                        '${places.rating.toStringAsFixed(1)}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

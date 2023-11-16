import 'package:flutter/material.dart';

class FeaturedPlacesPage extends StatelessWidget {
  final Map<String, dynamic> viagem;

  FeaturedPlacesPage({required this.viagem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                viagem['imagem_url'],
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
                    viagem['destino'],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    viagem['descricao'],
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Dias: ${viagem['qtddias']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Gasto total: \$${viagem['gastoalimentacao'] + viagem['gastopasseios'] + viagem['gastocultura'] + viagem['gatoesporte'] + viagem['gastoeventos'] + viagem['gastohotel']}',
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
                        '${viagem['nota'].toStringAsFixed(1)}',
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

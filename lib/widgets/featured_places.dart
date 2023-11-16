import 'package:flutter/material.dart';

class FeaturedPlaces extends StatelessWidget {
  final Map<String, dynamic>? viagem;

  FeaturedPlaces({
    required this.viagem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegação para a página de detalhes da viagem, se necessário
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
          child: viagem != null
              ? Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    viagem!['imagem_url'],
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
                        '${viagem!['nota'].toStringAsFixed(1)}',
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
                      viagem!['destino'],
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
          )
              : Center(
            child: Text('Viagem não disponível'),
          ),
        ),
      ),
    );
  }
}

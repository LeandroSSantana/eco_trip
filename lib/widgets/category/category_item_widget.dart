import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;

  CategoryItemWidget({
    required this.label,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Cor de fundo do quadrado cinza claro
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0), // Adicione um espaçamento no topo
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Cor do círculo branco
              ),
              child: Icon(
                icon,
                color: iconColor, // Cor do ícone
                size: 30.0,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

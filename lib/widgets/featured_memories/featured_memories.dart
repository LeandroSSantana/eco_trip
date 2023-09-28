// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget squareRowWidget(String label1, String imagePath1, String label2, String imagePath2) {
  AssetImage image1 = AssetImage(imagePath1);
  AssetImage image2 = AssetImage(imagePath2);

  return Row(
    children: [
      customSquareWidget(label1, image1, Alignment.bottomLeft),
      SizedBox(width: 30),
      customSquareWidget(label2, image2, Alignment.bottomLeft),
    ],
  );
}

Widget customSquareWidget(String label, AssetImage image, AlignmentGeometry alignment) {
  return GestureDetector(
    onTap: () {
      // Ação quando o quadrado for clicado
    },
    child: SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              // Define cantos arredondados
              image: DecorationImage(
                image: image, // Imagem para o quadrado
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: alignment, // Posição do rótulo
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Text(
                label, // Rótulo para o quadrado
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Cor do texto do rótulo
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
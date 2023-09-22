import 'package:flutter/material.dart';

Widget buildTopLeftCircles() {
  return Stack(
    alignment: Alignment.topLeft,
    children: [
      Positioned(
        top: -64,
        left: 21,
        child: Container(
          width: 165, // Largura maior para o círculo
          height: 160, // Altura maior para o círculo
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF0047AB).withOpacity(0.5),
          ),
          child: Center(),
        ),
      ),
      Positioned(
        top: -15,
        left: -68,
        child: Container(
          width: 165,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF0047AB).withOpacity(0.5),
          ),
          child: Center(),
        ),
      ),
    ],
  );
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:teste_telas/data/perfil_data.dart';

Stack headerProfilePage(BuildContext context) {
  return Stack(
    children: [
      Container(
        color: Color(0xFF0047AB),
        width: double.infinity,
        height: 280,
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinhe à esquerda
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, left: 16),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  'images/foto.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, left: 16),
              child: Text(
                perfilUsuario.nomeUsuario,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFDFD),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
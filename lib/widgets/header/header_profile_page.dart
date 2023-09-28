// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste_telas/data/perfil_data.dart';

Stack headerProfilePage(BuildContext context) {
  return Stack(
    children: [
      Container(
        color: Color(0xFF0047AB).withOpacity(0.9),
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
                child: Image.network(
                  perfilUsuario.fotoPerfil,
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
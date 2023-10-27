// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:teste_telas/data/perfil_data.dart';

Container headerProfilePage(BuildContext context) {
  return Container(
    color: Color(0xFF0047AB),
    width: double.infinity,
    height: 280,
    margin: EdgeInsets.only(bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 80, left: 30),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white, // Cor da borda
              width: 2.0,          // Espessura da borda (2px)
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              'images/foto.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 30),
          child: Row(
            children: [
              Text(
                perfilUsuario.nomeUsuario,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 100),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/travelling_data_page');
                },
                icon: Icon(
                  Icons.calculate,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

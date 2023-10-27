// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:teste_telas/data/perfil_data.dart';

Stack headerPage(BuildContext context) {
  return Stack(
    children: [
      Container(
        color: Color(0xFF0047AB),
        width: double.infinity,
        height: 250,
        margin: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 130,
                height: 130,
                decoration: BoxDecoration( //contorno imagem
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'images/foto.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                perfilUsuario.nomeUsuario,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFDFD),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned( // icone voltar
        top: 40,
        left: 12.5,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Adicione a lógica para voltar à tela anterior aqui
            Navigator.pop(context);
          },
        ),
      ),
    ],
  );
}

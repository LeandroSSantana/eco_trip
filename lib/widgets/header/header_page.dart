import 'package:flutter/material.dart';
import 'package:teste_telas/data/perfil_data.dart';

Stack headerPage(BuildContext context) {
  return Stack(
    children: [
      Container(
        color: Color(0xFF0047AB),
        width: double.infinity,
        height: 220,
        margin: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 3.0,
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    perfilUsuario.fotoPerfil,
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                perfilUsuario.nomeUsuario,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 20,
        left: 10,
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

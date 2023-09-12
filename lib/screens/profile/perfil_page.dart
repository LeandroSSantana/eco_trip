// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_telas/data/perfil_data.dart';
import 'package:teste_telas/model/profile/perfil_usuario_model.dart';
import 'package:teste_telas/screens/home_page/home_page.dart'; // Importe este pacote para controlar o teclado

class PerfilPage extends StatelessWidget {
  final PerfilUsuario perfil;

  PerfilPage({required this.perfil});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFd191),
        selectedLabelStyle: TextStyle(color: Colors.blue), // Cor do rótulo ativo
        unselectedLabelStyle: TextStyle(color: Colors.white),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.money_dollar_circle,
              color: Color(0xFFFF8c00),
            ),
            label: 'Orçamento',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.map_pin_ellipse,
              color: Color(0xFFFF8c00),
            ),
            label: 'Destino',
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.orangeAccent,
            // color: Color(0xFFe0e0e0),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60))),
            ),
          ),
          Container(
            height: (250),
            decoration: BoxDecoration(
                color: Color(0xFFFF8c00),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.menu_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.more_horiz,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Olá ${perfilUsuario.nomeUsuario} !',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w800,
                        fontSize: 28,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 180,
              left: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  perfilUsuario.fotoPerfil,
                  // scale: 3.8,
                  width: 120,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ))
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:teste_telas/data/perfil_data.dart';
import 'package:teste_telas/model/profile/perfil_usuario_model.dart';

class PerfilPage extends StatelessWidget {
  final PerfilUsuario perfil;

  PerfilPage({required this.perfil});

  Container buildModifierContainer(String text) {
    return Container(
      width: 215,
      height: 45,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xB20047AB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Row buildRowWithIcon(IconData iconData, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: Color(0xFF0047AB),
          size: 30,
        ),
        SizedBox(width: 15),
        buildModifierContainer(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // ícones que deseja usar
    List<IconData> icons = [
      Icons.calendar_month_rounded,
      Icons.monetization_on_outlined,
      Icons.pin_drop_rounded,
      Icons.tips_and_updates_outlined,
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
            Container(
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              height: 350,
              decoration: BoxDecoration(
                color: Color(0xFFD5D9E0),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildRowWithIcon(icons[0], 'Datas'),
                  buildRowWithIcon(icons[1], 'Orçamento'),
                  buildRowWithIcon(icons[2], 'Local'),
                  buildRowWithIcon(icons[3], 'Estilo de viagem'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  // Ação do botão
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0047AB).withAlpha(190),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'viajar',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Rubik',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

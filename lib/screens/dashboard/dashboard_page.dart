// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:teste_telas/model/profile/perfil_usuario_model.dart';
import 'package:teste_telas/screens/travel_page/travel_page.dart';
import 'package:teste_telas/widgets/header/header_page.dart';

class DashboardPage extends StatelessWidget {
  final PerfilUsuario perfil;

  DashboardPage({required this.perfil});

  Container buildModifierContainer(String text) {
    return Container(
      width: 215,
      height: 45,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xB20047AB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto-Bold'
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
      Icons.account_balance_wallet_outlined,
      Icons.pin_drop_rounded,
      Icons.tips_and_updates_outlined,
    ];

    return Scaffold(
      backgroundColor: Color(0xFFdcdcdc),
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerPage(context),
            Container(
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
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
            SizedBox(height: 10),
            Container(
              width: 300,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TravelPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0047AB).withAlpha(190),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Viajar',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
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

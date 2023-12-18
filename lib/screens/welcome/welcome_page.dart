// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Receba o argumento passado da página anterior
    final String fullName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(
                'images/mala.svg',
                width: 40,
                height: 40,
                color: Color(0xFF0047AB),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                'images/plane.svg',
                width: 40,
                height: 40,
                color: Color(0xFF0047AB),
              ),
            ),
            Text(
              'Olá, $fullName!', // Use o nome aqui
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Obrigado por se registrar no EcoTrip. Aqui estão algumas coisas que você pode fazer:',
              style: TextStyle(fontSize: 16),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('1. Complete seu perfil.'),
                Text('2. Explore os recursos do aplicativo.'),
                Text('3. Entre em contato conosco se precisar de ajuda.'),
              ],
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.fromLTRB(40, 10, 40, 20),
              child: CupertinoButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/profile_page");
                },
                color: Color(0xFF0047AB),
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text('Começar Agora',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SvgPicture.asset(
                'images/bolsa.svg',
                width: 40,
                height: 40,
                color: Color(0xFF0047AB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

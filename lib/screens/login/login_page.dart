// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_telas/data/perfil_data.dart';
import 'package:teste_telas/screens/dashboard/dashboard_page.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('images/bg_01.png'), context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg_01.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.colorBurn,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                      children: [
                        TextSpan(
                          text: 'EcoTrip - Viaje Melhor, ',
                        ),
                        TextSpan(
                          text: 'Gaste Menos!',
                          style: TextStyle(
                            color: Color(0xFFFF8c00),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 5,
                ),
                Text(
                  'Entre e continue a viajar',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                  ),
                ),

                // Container para o campo de email
                Container(
                  margin: EdgeInsets.fromLTRB(40, 130, 40, 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Rubik',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
                  child: CupertinoTextField(
                    placeholder: 'Email',
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),

                // Container para o campo de senha
                Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 40, 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Senha',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Rubik',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
                  child: CupertinoTextField(
                    placeholder: 'Senha',
                    style: TextStyle(color: Colors.white),
                    padding: EdgeInsets.all(16),
                    obscureText: true,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),

                // Espaço flexível para empurrar o botão para a parte inferior
                Expanded(child: Container()),

                // Botão Sign In
                Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 40, 20),
                  child: CupertinoButton(
                    onPressed: () {
                      // Adicione a lógica para o botão Sign In aqui
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DashboardPage(perfil: perfilUsuario,)),
                      );
                    },
                    color: Color(0xFFFF8c00),
                    borderRadius: BorderRadius.circular(40),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 70),
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),

                // Container para o texto "Cadastre-se"
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      // Navegar para a tela de cadastro
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Cadastre-se',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),

                // Container para o texto "Esqueceu sua senha? Clique aqui."
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/forgot_password');
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Esqueceu sua senha? ',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

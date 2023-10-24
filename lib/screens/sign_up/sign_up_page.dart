// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_telas/screens/profile_page/profile_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFdcdcdc),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  // logo

                  Image.asset(
                    'images/logo.png',
                    width: 187,
                    height: 232,
                  ),

                  // logotipo

                  Text(
                    'Ecotrip',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Roboto-Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //frase

                  RichText(
                    text: TextSpan(
                      text: 'Viaje mais, ',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontFamily: 'Roboto-Regular',
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Gaste menos!',
                          style: TextStyle(
                            color: Color(0xFF1F4AC2),
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  // nome completo

                  Container(
                    margin: EdgeInsets.fromLTRB(44, 50, 44, 0),
                    child: CupertinoTextField(
                      placeholder: 'nome completo',
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFDFD),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  // email

                  Container(
                    margin: EdgeInsets.fromLTRB(44, 15, 44, 0),
                    child: CupertinoTextField(
                      placeholder: 'e-mail',
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFDFD),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  // senha

                  Container(
                    margin: EdgeInsets.fromLTRB(44, 15, 44, 0),
                    child: CupertinoTextField(
                      placeholder: 'senha',
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFDFD),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  // confirmar senha

                  Container(
                    margin: EdgeInsets.fromLTRB(44, 15, 44, 0),
                    child: CupertinoTextField(
                      placeholder: 'confirmar senha',
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFDFD),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),
                  // button registre-se

                  Container(
                    child: CupertinoButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                      color: Color(0xFF0047AB),
                      borderRadius: BorderRadius.circular(40),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                        child: Text(
                          'Registre-se',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  // login

                  Container(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "/login");
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Já possui uma conta?',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'Roboto-Regular',
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Sign in',
                              style: TextStyle(
                                color: Color(0xFF1F4AC2),
                                fontSize: 18,
                                fontFamily: 'Roboto-Regular',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        )
    );
  }
}
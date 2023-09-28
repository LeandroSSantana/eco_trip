// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Cadastre-se'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoTextField(
                placeholder: 'Nome completo',
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                ),
                style: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              CupertinoTextField(
                placeholder: 'Email',
                padding: EdgeInsets.all(16),
                keyboardType: TextInputType.emailAddress, // Teclado de email
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                ),
                style: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.black,
                ),
                onSubmitted: (_) {
                  // Fecha o teclado quando pressionar "Voltar"
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                },
              ),
              SizedBox(height: 10),
              CupertinoTextField(
                placeholder: 'Senha',
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
                style: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.black,
                ),
              ),
              Spacer(), // Espaço flexível para empurrar os botões para baixo
              CupertinoButton(
                onPressed: () {
                  // TODO Lógica para realizar o cadastro
                },
                color: Color(0xFFFF8c00),
                borderRadius: BorderRadius.circular(40),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 70),
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Rubik',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    // TODO Adicione ação para o link "Já tem uma conta? Faça login"
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Já tem uma conta? Faça login',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontFamily: 'Rubik',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Esqueceu a senha'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoTextField(
                controller: _emailController,
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
                style: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              CupertinoButton(
                onPressed: () {
                  final email = _emailController.text;
                  // Aqui você pode adicionar a lógica para enviar o email de redefinição de senha
                  print('Solicitar redefinição de senha para o email: $email');
                },
                color: Color(0xFFFF8c00),
                borderRadius: BorderRadius.circular(40),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 70),
                  child: Text(
                    'Enviar Email de Recuperação',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Rubik',
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

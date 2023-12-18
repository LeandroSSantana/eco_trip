// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teste_telas/services/autenticacao_servico.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();

  final AutenticacaoServico _autenServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFdcdcdc),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              SvgPicture.asset(
                'images/logo.svg',
                width: 120,
                height: 120,
                color: Color(0xFF1F4AC2),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 20, 40, 10),
                child: Text(
                  'Que bom te ver novamente!',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Roboto-Regular',
                    color: Color(0xFF0047AB),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 20, 40, 10),
                child: Form(
                  key: _formKeyEmail,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Color(0xFFFFFDFD),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu email';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 10, 40, 60),
                child: Form(
                  key: _formKeyPassword,
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      filled: true,
                      fillColor: Color(0xFFFFFDFD),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira sua senha';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
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
                        color: Color(0xFF0047AB),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 10, 40, 20),
                child: CupertinoButton(
                  onPressed: () async {
                    // Validate the form
                    if (_formKeyEmail.currentState!.validate() &&
                        _formKeyPassword.currentState!.validate()) {
                      _formKeyEmail.currentState!.save();
                      _formKeyPassword.currentState!.save();

                      String email = emailController.text;
                      String password = passwordController.text;

                      String? loginError = await _autenServico.logarUsuario(
                        email: email,
                        password: password,
                      );

                      if (loginError != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(loginError),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        Navigator.pushNamed(context, '/profile_page');
                      }
                    }
                  },
                  color: Color(0xFF0047AB),
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text('LOG IN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Ainda não tem uma conta? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Color(0xFF0047AB),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
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

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:teste_telas/screens/forgot_password/email_sended_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
      child: Scaffold(
        backgroundColor: Color(0xFFdcdcdc),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10), // Ajuste das margens
                  child: Text(
                    'Digite um e-mail válido para redefinir sua senha.',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Roboto-Regular',
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40, top: 50, bottom: 10), // Ajuste das margens
                  child: CupertinoTextField(
                    placeholder: 'Email',
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFDFD),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 20), // Ajuste das margens
                  child: CupertinoButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmailSendedPage(),
                        ),
                      );
                    },
                    color: Color(0xFF0047AB),
                    borderRadius: BorderRadius.circular(40),
                    minSize: 60,
                    child: Container(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Enviar Email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
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

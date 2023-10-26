// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_telas/screens/login/login_page.dart';

class EmailSendedPage extends StatelessWidget {

  EmailSendedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdcdcdc),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 150),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 10), // Ajuste das margens
                child: Text(
                  'Email Enviado!',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto-Regular',
                    color: Color(0xFF0047AB),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: SvgPicture.asset(
                    'images/check-circle.svg',
                    width: 100,
                    height: 100,
                    color: Color(0xFF0047AB),
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
                        builder: (context) => LogInPage(),
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
                        'Retornar para Login',
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
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teste_telas/screens/dashboard/dashboard_page.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdcdcdc),
      resizeToAvoidBottomInset: true,
      body: ListView(
        children: [
          // buildTopLeftCircles(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
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
                margin: EdgeInsets.fromLTRB(40, 80, 40, 10),
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
                margin: EdgeInsets.fromLTRB(40, 10, 40, 60),
                child: CupertinoTextField(
                  placeholder: 'Senha',
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFDFD),
                    borderRadius: BorderRadius.circular(30),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardPage(),
                      ),
                    );
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
        ],
      ),
    );
  }
}

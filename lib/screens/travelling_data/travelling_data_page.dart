// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TravellingDataPage extends StatelessWidget {
  const TravellingDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFdcdcdc),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  // logo
                  SvgPicture.asset(
                    'images/logo.svg',
                    width: 120,
                    height: 120,
                    color: Color(0xFF1F4AC2),
                  ),
                  const SizedBox(height: 30),
                  // nome completo
                  Container(
                    margin: EdgeInsets.fromLTRB(44, 10, 44, 0),
                    child: CupertinoTextField(
                      placeholder: 'teste',
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFDFD),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.fromLTRB(44, 15, 44, 0),
                    child: CupertinoTextField(
                      placeholder: 'teste',
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFDFD),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.fromLTRB(44, 15, 44, 0),
                    child: CupertinoTextField(
                      placeholder: 'teste',
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFDFD),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // confirmar senha
                  Container(
                    margin: EdgeInsets.fromLTRB(44, 15, 44, 0),
                    child: CupertinoTextField(
                      placeholder: 'teste',
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFDFD),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 50),
                  // button registre-se
                  Container(
                    child: CupertinoButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/welcome_page");
                      },
                      color: Color(0xFF0047AB),
                      borderRadius: BorderRadius.circular(40),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                        child: Text(
                          'Salvar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



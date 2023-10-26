// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_telas/screens/login/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LogInPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0047AB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ecotrip',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Roboto-Regular',
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: 'Viaje mais, ',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto-Regular',
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'Gaste menos!',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto-Regular',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            SvgPicture.asset(
              'images/logo.svg',
              width: 180,
              height: 180,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}


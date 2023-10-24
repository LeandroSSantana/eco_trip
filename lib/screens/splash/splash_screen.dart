// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/signup');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 71, 171),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              // logotipo 

              Text(
                'Ecotrip',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto-Regular',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              // frase

              RichText(
                text: TextSpan(
                  text: 'Viaje mais, ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Roboto-Regular',
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Gaste menos!',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto-Regular',
                        ),
                      )
                    ],
                ),
              ),

              const SizedBox(height: 50,),
              // logo

              Image.asset(
                'images/logoW.png'
                )

            ],
          ),
        ),
      )
    );
  }
}

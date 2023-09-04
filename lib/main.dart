// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'screens/forgot_password/forgot_password_page.dart';
import 'screens/login/login_page.dart';
import 'screens/sign_up/sign_up_page.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Defina a rota inicial como a SplashScreen
      routes: {
        '/': (context) => SplashScreen(), // Rota da SplashScreen
        '/login': (context) => LogInPage(), // Rota da tela de login
        '/signup': (context) => SignUpPage(), // Rota da tela de cadastro
        '/forgot_password': (context) => ForgotPasswordPage(), // Rota para a tela de esqueceu senha
      },
    );
  }
}

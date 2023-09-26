// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:teste_telas/data/perfil_data.dart';
import 'package:teste_telas/model/category/category_model.dart';
import 'package:teste_telas/screens/dashboard/dashboard_page.dart';
import 'package:teste_telas/screens/home_page/home_page.dart';
import 'package:teste_telas/screens/profile_page/profile_page.dart';

import 'screens/category/alimentacao_page.dart';
import 'screens/category/featured_places_page.dart';
import 'screens/category/dicas_page.dart';
import 'screens/category/passeios_page.dart';
import 'screens/category/vida_noturna_page.dart';
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
        '/home_page': (context) => HomePage(), // Rota para a HomePage
        '/dicas': (context) => DicasPage(),
        '/passeios': (context) => PasseiosPage(),
        '/alimentacao': (context) => AlimentacaoPage(),
        '/vida_noturna': (context) => VidaNoturnaPage(),
        '/dashboard_page': (context) => DashboardPage(perfil: perfilUsuario),
        '/profile_page': (context) => ProfilePage(),
      },
    );
  }
}
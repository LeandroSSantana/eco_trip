// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:teste_telas/screens/dashboard/dashboard_page.dart';
import 'screens/forgot_password/forgot_password_page.dart';
import 'screens/login/login_page.dart';
import 'screens/profile_page/profile_page.dart';
import 'screens/sign_up/sign_up_page.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/travel_page/travel_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', //rota inicial como a SplashScreen
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LogInPage(),
        '/signup': (context) => SignUpPage(),
        '/forgot_password': (context) => ForgotPasswordPage(),
        '/home_page': (context) => TravelPage(),
        '/dashboard_page': (context) => DashboardPage(),
        '/profile_page': (context) => ProfilePage(),
      },
    );
  }
}
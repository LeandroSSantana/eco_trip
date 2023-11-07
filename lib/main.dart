// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teste_telas/data/perfil_data.dart';
import 'package:teste_telas/screens/dashboard/dashboard_page.dart';
import 'package:teste_telas/screens/travelling_data/travelling_data_page.dart';
import 'package:teste_telas/screens/typesTrip/foodPage.dart';
import 'package:teste_telas/screens/typesTrip/barPage.dart';
import 'package:teste_telas/screens/typesTrip/culturePage.dart';
import 'package:teste_telas/screens/typesTrip/esportPage.dart';
import 'package:teste_telas/screens/typesTrip/eventsPage.dart';
import 'package:teste_telas/screens/typesTrip/hotelPage.dart';
import 'package:teste_telas/screens/typesTrip/outingPage.dart';
import 'package:teste_telas/screens/welcome/welcome_page.dart';
import 'package:teste_telas/widgets/elements/dashboard_form.dart';
import 'screens/forgot_password/forgot_password_page.dart';
import 'screens/login/login_page.dart';
import 'screens/profile_page/profile_page.dart';
import 'screens/sign_up/sign_up_page.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/travel_page/travel_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
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
        '/home_page': (context) => DashboardForm(),
        '/dashboard_page': (context) => DashboardPage(),
        '/profile_page': (context) => ProfilePage(),
        '/travel_page': (context) => TravelPage(),
        '/travelling_data_page': (context) => TravellingDataPage(),
        '/welcome_page': (context) => WelcomePage(perfilUsuario),
        '/alimentationPage': (context) => FoodPage(),
        '/outingPage': (context) => OutingPage(),
        '/culturePage': (context) => CulturePage(),
        '/barPage': (context) => BarPage(),
        '/esportPage': (context) => EsportPage(),
        '/hotelPage': (context) => HotelPage(),
        '/eventsPage': (context) => EventsPage(),
      },
    );
  }
}
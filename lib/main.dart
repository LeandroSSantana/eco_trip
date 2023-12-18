// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:teste_telas/screens/welcome/welcome_page.dart';
import 'screens/featured_travels/featured_travels_page.dart';
import 'screens/forgot_password/forgot_password_page.dart';
import 'screens/login/login_page.dart';
import 'screens/profile_page/profile_page.dart';
import 'screens/save_local_page/save_local_page.dart';
import 'screens/save_travel_page/save_travel_page.dart';
import 'screens/sign_up/sign_up_page.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/travel_filter_page/travel_filter_page.dart';
import 'screens/travel_page/travel_page.dart';

const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyDSeGDGUSBoDDwsXb4bI7ioZSoy9K7YRps",
    authDomain: "ecotripp-4e5db.firebaseapp.com",
    projectId: "ecotripp-4e5db",
    storageBucket: "ecotripp-4e5db.appspot.com",
    messagingSenderId: "750820710962",
    appId: "1:750820710962:web:8117e8e61386298acafa2b");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);
  // await Firebase.initializeApp();
  await Supabase.initialize(
    url: 'https://stwidkgzdzfsqtswlwhd.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN0d2lka2d6ZHpmc3F0c3dsd2hkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk5NjYzMDgsImV4cCI6MjAxNTU0MjMwOH0.8jcwVzCLnaNikRNjzgPTwrAAfQcKPzeTKkiYeL5_6iQ',
  );
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
        '/welcome_page': (context) => WelcomePage(),
        '/forgot_password': (context) => ForgotPasswordPage(),
        '/save_local_page': (context) => SaveLocalPage(),
        '/save_travel_page': (context) => SaveTravelPage(),
        '/travel_filter_page': (context) => TravelFilterPage(),
        '/travel_page': (context) => TravelPage(),
        '/profile_page': (context) => ProfilePage(),
        '/featured_travels_page': (context) => FeaturedTravelsPage(),
      },
    );
  }
}

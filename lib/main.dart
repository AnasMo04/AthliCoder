
import 'package:demo_app/GetStartedScreen.dart';
import 'package:demo_app/GoalsScreen.dart';
import 'package:demo_app/HomeScreen.dart';
import 'package:demo_app/LoginScreen.dart';
import 'package:demo_app/SignUpScreen.dart';
import 'package:demo_app/SplashScreen2.dart';
import 'package:demo_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'SplashScreen.dart';




Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
    
    await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( AthliCoder());
} 

class AthliCoder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AthliCoder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101010),
        fontFamily: 'RobotoMono',
      ),
     
     routes: {
        '/': (context) => SplashScreen(),
        '/splash2': (context) => SplashScreen2(),
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/goals': (context) =>  GoalsScreen(),
        '/GetStarted': (context) => GetStartedScreen(),
        '/home': (context) =>  HomeScreen(),
        
      },
    ); 
  }
}
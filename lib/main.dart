
import 'package:demo_app/Presentation/Screens/GetStartedScreen.dart';
import 'package:demo_app/Presentation/Screens/GoalsScreen.dart';
import 'package:demo_app/Presentation/Screens/HomeScreen.dart';
import 'package:demo_app/Presentation/Screens/Auth/LoginScreen.dart';
import 'package:demo_app/Presentation/Screens/Auth/SignUpScreen.dart';
import 'package:demo_app/Presentation/Screens/Splash/SplashScreen2.dart';
import 'package:demo_app/Presentation/Screens/username_screen.dart';
import 'package:demo_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Presentation/Screens/Splash/SplashScreen.dart';




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
        '/username': (context) =>  UsernameScreen(),
        '/home': (context) =>  HomeScreen(),
        
      },
    ); 
  }
}
import 'dart:async'; // Import the async library for Timer
import 'package:flutter/material.dart';

class SplashScreen2 extends StatefulWidget {

  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {

  @override
  void initState() {
    super.initState();
  
    Timer(const Duration(seconds: 5), () {
     
      Navigator.of(context).pushReplacementNamed('/signup');
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 140,
                  width: 140,
                  child: Image.asset(
                    'assets/Logo1.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 48),
                CircularProgressIndicator(
                  color: Colors.orange[700],
                  strokeWidth: 5,
                ),
                SizedBox(height: 36),
                Text(
                  'Entering\nthe Zone...',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.orange[700],
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono',
                    height: 1.2,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
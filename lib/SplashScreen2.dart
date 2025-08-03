import 'dart:async'; // Import the async library for Timer
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SplashScreen2 extends StatefulWidget {

  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {

  @override
  void initState() {
    super.initState();
  
    Timer(const Duration(seconds: 10), () {
     
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
                  height: 300,
                  width: 300,
                  child: RiveAnimation.asset(
                        'assets/covering_hoodie_pro.riv',
                        fit: BoxFit.contain,
                     stateMachines: const ['State Machine 1'],
                          ),
                ),
                SizedBox(height: 5),
                CircularProgressIndicator(
                  color: const Color.fromARGB(255, 226, 133, 40),
                  strokeWidth: 5,
                ),
                SizedBox(height: 36),
                Text(
                  'Entering\nthe Zone...',
                  style: TextStyle(
                    fontSize: 32,
                    color:  const Color.fromARGB(255, 226, 133, 40),
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
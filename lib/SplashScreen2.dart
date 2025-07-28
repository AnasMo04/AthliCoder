import 'package:flutter/material.dart';

class SplashScreen2 extends StatelessWidget {
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
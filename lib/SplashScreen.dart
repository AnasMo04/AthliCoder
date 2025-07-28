import 'package:flutter/material.dart';
import 'SplashScreen2.dart';
import 'package:rive/rive.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool loading = false;

  void _enterZone() async {
    setState(() {
      loading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => SplashScreen2()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 140,
                  width: 140,
                  child:  RiveAnimation.asset(
                        'assets/logo.riv',
                        fit: BoxFit.contain,
                     stateMachines: const ['main'],
  ),
                ),
                SizedBox(height: 48),
                Text(
                  'WE RISE IN SILENCE,\nCODE IN SHADOWS,\nLIFT WITH PURPOSE',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontFamily: 'RobotoMono',
                    letterSpacing: 1.8,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 64),
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[700],
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'RobotoMono',
                      ),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: loading ? null : _enterZone,
                    child: loading
                        ? SizedBox(
                            height: 26,
                            width: 26,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 3,
                            ),
                          )
                        : Text('Enter Zone'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'SplashScreen.dart';

import 'package:rive/rive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp( ZoneApp());
}

class ZoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zone Entry',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101010),
        fontFamily: 'RobotoMono',
      ),
     
      home: SplashScreen(),
    );
  }
}
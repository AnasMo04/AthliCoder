import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color orangeColor = Colors.orange[700]!;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
            // The main column is now aligned to the start (left)
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 1. Align content to the left
              children: [
                // Centering only the top logo and title row
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Logo1.png',
                        height: 100, // 2. Made the logo much bigger
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'AthliCoder',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                           color: Colors.grey[350], // 4. Color corrected to white
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60), // 3. Adjusted spacing
                Text(
                  'Join the\nAthliCoder \nCommunity',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                     color: Colors.grey[350], // 4. Color corrected to white
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 35), // 3. Adjusted spacing
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    fillColor: const Color(0xFF1F1F1F), // Slightly lighter grey for fields
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // Slightly more rounded corners
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    fillColor: const Color(0xFF1F1F1F),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    fillColor: const Color(0xFF1F1F1F),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 35), // 3. Adjusted spacing
                // Stretched button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orangeColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/goals');
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                         color:Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25), // 3. Adjusted spacing
                // Centering the bottom text
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: 'RobotoMono',
                        fontSize: 14,
                      ),
                      children: [
                        const TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'Log In',
                          style: TextStyle(
                            color: orangeColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacementNamed('/login');
                            },
                        ),
                      ],
                    ),
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
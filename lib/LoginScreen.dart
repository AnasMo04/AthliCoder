import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the orange color once to reuse it
    final Color orangeColor = Colors.orange[700]!;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
            // The main column is aligned to the start (left) to match SignUpScreen
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Centering only the top logo and title row
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Logo1.png',
                        height: 100, // Matched logo size
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'AthliCoder',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[350], // Matched text color
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60), // Matched spacing
                Text(
                  'Nice to \nsee you again!',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[350], // Matched text color
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 35), // Matched spacing
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    fillColor: const Color(0xFF1F1F1F), // Matched field color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // Matched border radius
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
                    fillColor: const Color(0xFF1F1F1F), // Matched field color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // Matched border radius
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 35), // Matched spacing
                // Stretched button to match
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orangeColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Matched border radius
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/GetStarted');
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:Colors.black, // Matched button text color
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25), // Matched spacing
                // Centering the bottom text and using RichText to match
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: 'RobotoMono',
                        fontSize: 14,
                      ),
                      children: [
                        const TextSpan(text: "Don't have an account? "),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: orangeColor, // Matched link color
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate using the named route
                              Navigator.of(context).pushReplacementNamed('/signup');
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
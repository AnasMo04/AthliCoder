
import 'package:demo_app/data/services/auth_service.dart';
import 'package:demo_app/presentation/widgets/custom_text_field.dart'; 
import 'package:flutter/material.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({Key? key}) : super(key: key);

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final AuthService _authService = AuthService();
  final _usernameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _startMission() async {
    if (_usernameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a name to continue')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await _authService.updateUsername(_usernameController.text);
      if (mounted) {
    
        Navigator.of(context).pushReplacementNamed('/GetStarted');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color orangeColor = Colors.orange[700]!;
    final Color mainTextColor = Colors.grey[350]!;
    final Color hintTextColor = Colors.grey[600]!;
    final Color backgroundColor = const Color(0xFF121212);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Opacity(
                  opacity: 0.1,
                  child: Image.asset(
                    'assets/Logo1.png',
                    height: 150,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "EVERY LEGEND HAS A NAME...\nWHAT'S YOURS?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: mainTextColor,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 40),

                CustomTextField(
                  controller: _usernameController,
                  hintText: 'Your Username',
                  prefixIcon: Icons.shield_moon_outlined,
                  textAlign: TextAlign.center, 
                ),
                const SizedBox(height: 25),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: orangeColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _isLoading ? null : _startMission,
                  child: _isLoading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                              strokeWidth: 3, color: Colors.black),
                        )
                      : const Text(
                          'START THE MISSION',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                ),
                const SizedBox(height: 20),
                Text(
                  'You can change this later in your profile settings.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: hintTextColor,
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
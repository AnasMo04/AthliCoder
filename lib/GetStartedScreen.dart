import 'package:flutter/material.dart';

// An enum to define the types of activities and manage state easily
enum Activity { workout, coding }

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  // This variable will hold the currently selected activity.
  // It's nullable, meaning it can be null (no selection).
  Activity? _selectedActivity;

  @override
  Widget build(BuildContext context) {
    final Color orangeColor = Colors.orange[700]!;
    final Color darkGreyColor = const Color(0xFF1F1F1F);
    final Color textGreyColor = Colors.grey[350]!;

    // Booleans to check which activity is selected. This makes the code cleaner.
    final bool isWorkoutSelected = _selectedActivity == Activity.workout;
    final bool isCodingSelected = _selectedActivity == Activity.coding;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/Logo1.png', height: 100),
                    const SizedBox(width: 12),
                    Text(
                      'AthliCoder',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: textGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),

              // "Get Started" Title
              Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: textGreyColor,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 35),

              // --- Start Workout Button ---
              GestureDetector(
                onTap: () {
                  // When tapped, update the state to select 'workout'
                  setState(() {
                    _selectedActivity = Activity.workout;
                  });
                  
                  // ** MODIFICATION HERE **
                  // Navigate to the home screen after a short delay
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Navigator.of(context).pushReplacementNamed('/home');
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    // If workout is selected, use orange, otherwise use grey
                    color: isWorkoutSelected ? orangeColor : darkGreyColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.directions_run, // Placeholder icon
                        // If workout is selected, icon is black, otherwise orange
                        color: isWorkoutSelected ? Colors.black : orangeColor,
                        size: 32,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Start Workout',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // If workout is selected, text is black, otherwise white
                          color: isWorkoutSelected ? Colors.black : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // --- Start Coding Button ---
              GestureDetector(
                onTap: () {
                  // When tapped, update the state to select 'coding'
                  setState(() {
                    _selectedActivity = Activity.coding;
                  });

                  // ** MODIFICATION HERE **
                  // Navigate to the home screen after a short delay
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Navigator.of(context).pushReplacementNamed('/home');
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    // If coding is selected, use orange, otherwise use grey
                    color: isCodingSelected ? orangeColor : darkGreyColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.code, // Placeholder icon
                        // If coding is selected, icon is black, otherwise orange
                        color: isCodingSelected ? Colors.black : orangeColor,
                        size: 32,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Start Coding',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // If coding is selected, text is black, otherwise white
                          color: isCodingSelected ? Colors.black : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
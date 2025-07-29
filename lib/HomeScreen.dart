import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // For Bottom Navigation Bar

  // Dummy state for tasks
  bool isWorkoutCompleted = false;
  bool isCodingCompleted = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Here you would navigate to other pages like Profile, Achievements, etc.
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color orangeColor = Colors.orange[700]!;
    final Color cardColor = const Color(0xFF1F1F1F);

    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header (Consistent with other screens)
                Center(
                  child: Image.asset('assets/Logo1.png', height: 80),
                ),
                const SizedBox(height: 24),

                // User Stats Card (Idea from QuizZone)
                _buildStatsCard(cardColor, orangeColor),
                const SizedBox(height: 40),

                // Daily Tasks Section
                const Text(
                  "Today's Mission",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Workout Task
                _DailyTaskCard(
                  icon: Icons.fitness_center,
                  title: 'Morning Workout',
                  description: '15 min HIIT session',
                  isCompleted: isWorkoutCompleted,
                  onChanged: (value) {
                    setState(() {
                      isWorkoutCompleted = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                
                // Coding Task
                _DailyTaskCard(
                  icon: Icons.code,
                  title: 'Code Challenge',
                  description: 'Solve one easy problem on LeetCode',
                  isCompleted: isCodingCompleted,
                  onChanged: (value) {
                    setState(() {
                      isCodingCompleted = value!;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: cardColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_outlined),
            label: 'Achievements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_outlined),
            label: 'Leaderboard',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: orangeColor,
        unselectedItemColor: Colors.grey[600],
        onTap: _onItemTapped,
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
    );
  }

  // Helper widget for the user stats card
  Widget _buildStatsCard(Color cardColor, Color orangeColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('5', 'Day Streak', orangeColor),
          _buildStatItem('12', 'Workouts'),
          _buildStatItem('20', 'Codes'),
        ],
      ),
    );
  }

  // Helper widget for each item in the stats card
  Widget _buildStatItem(String value, String label, [Color? valueColor]) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}


// A custom widget for displaying a daily task
class _DailyTaskCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isCompleted;
  final ValueChanged<bool?> onChanged;

  const _DailyTaskCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color orangeColor = Colors.orange[700]!;
    final Color cardColor = const Color(0xFF1F1F1F);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: orangeColor, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
              ],
            ),
          ),
          Transform.scale(
            scale: 1.4,
            child: Checkbox(
              value: isCompleted,
              onChanged: onChanged,
              activeColor: orangeColor,
              checkColor: Colors.black,
              side: BorderSide(color: Colors.grey[700]!, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:my_ai_fitness_buddy/fitness/workout/configuration/exercise_configuration_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configure Your Exercises'),
      ),
      body: Center(
        child: Text('This is where you configure your exercises and workout templates.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the settings screen.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExerciseConfigurationWidget()),
          );
        },
        tooltip: 'Settings',
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('My Exercises'),
              onTap: () {

              },
            ),
            ListTile(
              title: const Text('My Workout Templates'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExerciseConfigurationWidget()),
                );
              },
            ),
            ListTile(
              title: const Text('My Workout Plans'),
              onTap: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}
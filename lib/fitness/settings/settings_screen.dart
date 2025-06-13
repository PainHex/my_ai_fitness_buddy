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
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Configure exercises'),
            ),
            ListTile(
              title: const Text('Add an Exercise'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Customize an Exercise'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_ai_fitness_buddy/database/database_helper.dart';
import 'package:my_ai_fitness_buddy/fitness/navigation/navigation_bar.dart';
import 'package:my_ai_fitness_buddy/fitness/workout/activity/active_workout_widget.dart';
import 'package:my_ai_fitness_buddy/fitness/workout/configuration/exercise_configuration_widget.dart';

import 'fitness/workout/workout_plan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fit App',
      theme: ThemeData(
        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          // ···
          brightness: Brightness.light,
        ),

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
          // ···
          titleLarge: GoogleFonts.oswald(
            fontSize: 24,
            fontStyle: FontStyle.normal,
          ),
          bodyMedium: GoogleFonts.oswald(
            fontSize: 14,
            fontStyle: FontStyle.normal,
          ),
          displaySmall: GoogleFonts.merriweather(
            fontSize: 12,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      home: InternalNavigationBar(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Exercise> exercises = [];

  _addExercise() async {
    Exercise? exercise = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ExerciseConfigurationWidget();
      },
    );

    if (exercise != null) {
      setState(() {
        exercises.add(exercise);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (exercises.isEmpty) {
      child = Text('Add exercises to create a workout plan.');
    } else {
      child = Column(children: [ActiveWorkoutWidget(exercises)]);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Material(
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: SingleChildScrollView(child: child),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addExercise,
        tooltip: 'Add Exercise',
        child: const Icon(Icons.add),
      ),
    );
  }
}

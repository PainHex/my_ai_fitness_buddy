import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ai_fitness_buddy/fitness/workout/activity/active_exercise_widget.dart';
import 'package:my_ai_fitness_buddy/fitness/workout/workout_plan.dart';

class ActiveWorkoutWidget extends StatelessWidget {
  final List<Exercise> exercises;

  const ActiveWorkoutWidget(this.exercises, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          <Widget>[
            Text(
              "My Workout",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32),
            ),
          ] +
          exercises.map((exercise) {
            return ActiveExerciseWidget(exercise);
          }).toList(),
    );
  }
}

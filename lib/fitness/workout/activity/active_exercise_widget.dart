import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ai_fitness_buddy/fitness/workout/activity/active_set_widget.dart';
import 'package:my_ai_fitness_buddy/fitness/workout/workout_plan.dart';

class ActiveExerciseWidget extends StatelessWidget {
  final Exercise exercise;

  const ActiveExerciseWidget(this.exercise, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          <Widget>[
            Text(
              exercise.name,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20),
            ),
          ] +
          exercise.sets.map((set) {
            return ActiveSetWidget(set);
          }).toList(),
    );
  }
}

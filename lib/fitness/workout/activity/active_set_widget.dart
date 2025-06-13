import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ai_fitness_buddy/fitness/workout/workout_plan.dart';

class ActiveSetWidget extends StatelessWidget {
  final ExerciseSet exerciseSet;
  bool? complete = false;

  ActiveSetWidget(this.exerciseSet, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Reps: " + exerciseSet.reps.toString()),
        Spacer(),
        Text("Weight: " + exerciseSet.weight.toString()),
        Spacer(),
        Checkbox(
          value: complete,
          onChanged: (value) {
            complete = value;
          },
        ),
      ],
    );
  }
}

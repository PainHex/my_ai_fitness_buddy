import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ai_fitness_buddy/fitness/workout/workout_plan.dart';
import 'package:numeric_selector/numeric_selector.dart';

class SetConfigurationWidget extends StatelessWidget {

  int reps = 10;
  int weight = 30;

  ExerciseSet getExerciseSet() {
    return ExerciseSet(reps, weight);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.all(4.0), child: Text("Reps")),
        Spacer(),
        Padding(
          padding: EdgeInsets.all(4.0),
          child: VerticalNumericSelector(
            minValue: 0,
            maxValue: 100,
            step: 1,

            initialValue: reps,
            onValueChanged: (value) {
              reps = value;
            },
            viewPort: 0.3,
            height: 50,
            selectedTextStyle: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            unselectedTextStyle: TextStyle(
              fontSize: 24,
              color: Colors.grey,
            ),
            backgroundColor: Colors.white,
            showLabel: true,
            label: "Number Of Reps",
            showArrows: false,
            enableVibration: true,
            showSelectedValue: false,
          ),
        ),
        Spacer(),
        Padding(padding: EdgeInsets.all(4.0), child: Text("Weight")),
        Spacer(),
        Padding(
          padding: EdgeInsets.all(4.0),
          child: VerticalNumericSelector(
            minValue: 0,
            maxValue: 600,
            step: 5,
            initialValue: weight,
            onValueChanged: (value) {
              weight = value;
            },
            height: 50,
            viewPort: 0.3,
            selectedTextStyle: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            unselectedTextStyle: TextStyle(
              fontSize: 24,
              color: Colors.grey,
            ),
            backgroundColor: Colors.white,
            showLabel: true,
            label: "Weight",
            showArrows: false,
            enableVibration: true,
            showSelectedValue: false,
          ),
        ),
      ],
    );
  }

}
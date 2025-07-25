import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ai_fitness_buddy/fitness/settings/service/exercise_service.dart';

import 'package:numeric_selector/numeric_selector.dart';

import '../../../database/model/exercise.dart';

class SetConfigurationWidget extends StatelessWidget {

  ExerciseService exerciseService = ExerciseService();

  int reps = 10;
  int weight = 30;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Exercise>>(future: exerciseService.getExercises(), builder: (BuildContext context, AsyncSnapshot<List<Exercise>> snapshot) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DropdownButton<String>(
            items: snapshot.data?.map((value) {

              print(value.name);
              return DropdownMenuItem<String>(
                value: value.name,
                child: Text(value.name),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle exercise selection
            },
            hint: Text("Select Exercise"),
          )
        ],
      );
    });
  }

}
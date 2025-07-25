import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ai_fitness_buddy/fitness/workout/configuration/set_configuration_widget.dart';
import 'package:my_ai_fitness_buddy/fitness/workout/workout_plan.dart';
import 'package:numeric_selector/numeric_selector.dart';

class ExerciseConfigurationWidget extends StatefulWidget {
  const ExerciseConfigurationWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExerciseConfigurationWidgetState();
  }

}

class _ExerciseConfigurationWidgetState extends State<ExerciseConfigurationWidget> {
  TextEditingController exerciseName = TextEditingController();
  int _numberOfSets = 4;
  List<SetConfigurationWidget> sets = [];

  Widget _generateSetConfigurations() {

    sets = [];

    for (int i = 0; i < _numberOfSets; i++) {
      sets.add(
          SetConfigurationWidget()
      );
    }

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: sets);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.blue.shade100,
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: exerciseName,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: "Exercise Name",
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                      ),
                    ),
                    Text("Sets"),
                    HorizontalNumericSelector(
                      minValue: 0,
                      maxValue: 10,
                      step: 1,
                      initialValue: 4,
                      onValueChanged: (value) {
                        setState(() {
                          _numberOfSets = value;
                        });
                      },
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
                      label: "Number Of Sets",
                      showArrows: false,
                      enableVibration: true,
                      showSelectedValue: false,
                    ),
                    _generateSetConfigurations(),
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: Text('Add'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
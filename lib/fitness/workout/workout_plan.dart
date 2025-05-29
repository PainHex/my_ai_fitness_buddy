import 'dart:ffi';

class WorkoutPlan {

  List<Exercise> exercises;

  WorkoutPlan(this.exercises);

}

class Exercise {

  String name;
  List<ExerciseSet> sets;

  Exercise(this.name, this.sets);

}

class ExerciseSet {

  Int reps;
  Int weight;

  ExerciseSet(this.reps, this.weight);

}
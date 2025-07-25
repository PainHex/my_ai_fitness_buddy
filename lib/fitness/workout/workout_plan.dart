
class WorkoutTemplate {

  List<Exercise> exercises;

  WorkoutTemplate(this.exercises);

}

class Exercise {

  String name;
  List<ExerciseSet> sets;

  Exercise(this.name, this.sets);

}

class ExerciseSet {

  int reps;
  int weight;

  ExerciseSet(this.reps, this.weight);

}
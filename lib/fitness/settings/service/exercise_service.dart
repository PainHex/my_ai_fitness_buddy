import 'package:my_ai_fitness_buddy/database/database_helper.dart';

import '../../../database/model/exercise.dart';

class ExerciseService {

  void addCustomExercise(String exerciseName) {
    final exercise = ExerciseModel(null, exerciseName);
    DatabaseHelper.instance.insert([exercise]);
  }

  // Example method to get all exercises
  Future<List<ExerciseModel>> getExercises() async {
    
     List<Map<String, dynamic>> entities = await DatabaseHelper.instance.queryAllRows(ExerciseModel.TABLE_NAME);
     var exercises = entities.map(ExerciseModel.fromMap).toList();
     print(exercises);

     return exercises;
  }
}

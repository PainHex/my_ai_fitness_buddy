import 'package:my_ai_fitness_buddy/database/model/base_database_entity.dart';

class Exercise implements BaseDatabaseEntity {

  static const String TABLE_NAME = "exercise";

  int? id;
  String name;

  Exercise(this.id, this.name);

  Exercise.fromMap(Map<String, dynamic> rowData)
    : id = rowData['id'],
      name = rowData['name'];

  @override
  String get primaryKeyFieldName => "_id";

  @override
  String get tableName => TABLE_NAME;

  @override
  Map<String, dynamic> toMap() {
    return Map.from({'_id': id, 'name': name});
  }

  @override
  int? getId() {
    return id;
  }
}

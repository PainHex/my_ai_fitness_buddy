abstract class BaseDatabaseEntity {
  /// Converts the entity to a map representation.
  Map<String, dynamic> toMap();

  int? getId();

  /// Creates an entity from a map representation.
  factory BaseDatabaseEntity.fromMap(Map<String, dynamic> map) {
    throw UnimplementedError('fromMap must be implemented in subclasses');
  }

  /// Returns the table name for the entity.
  String get tableName;

  /// Returns the primary key field name for the entity.
  String get primaryKeyFieldName;
}

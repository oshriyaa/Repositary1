import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor/moor.dart';

part 'moor_database.g.dart';

@DataClassName('MyTask')
class Tasks extends Table {
  IntColumn get taskID => integer().autoIncrement()();
  TextColumn get taskTitle => text().withLength(min: 1, max: 50)();
  TextColumn get taskDesc => text().withLength(min: 1, max: 500)();
  TextColumn get taskCategory => text()();
}

@UseMoor(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<MyTask>> getAllTasks() => select(tasks).get();
  Stream<List<MyTask>> watchAllTasks() => select(tasks).watch();
  Future insertTask(TasksCompanion mytask) => into(tasks).insert(mytask);
  // Future updateTask(int id) {
  //   return (update(tasks)..where((tbl) => tbl.taskID.equals(id))).replace(entity);
  // }

  Future updateTask(TasksCompanion mytask) => update(tasks).replace(mytask);
  Future? deleteTask(int id) {
    return (delete(tasks)..where((tbl) => tbl.taskID.equals(id))).go();
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MyTask extends DataClass implements Insertable<MyTask> {
  final int taskID;
  final String taskTitle;
  final String taskDesc;
  final String taskCategory;
  MyTask(
      {required this.taskID,
      required this.taskTitle,
      required this.taskDesc,
      required this.taskCategory});
  factory MyTask.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MyTask(
      taskID: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}task_i_d'])!,
      taskTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}task_title'])!,
      taskDesc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}task_desc'])!,
      taskCategory: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}task_category'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['task_i_d'] = Variable<int>(taskID);
    map['task_title'] = Variable<String>(taskTitle);
    map['task_desc'] = Variable<String>(taskDesc);
    map['task_category'] = Variable<String>(taskCategory);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      taskID: Value(taskID),
      taskTitle: Value(taskTitle),
      taskDesc: Value(taskDesc),
      taskCategory: Value(taskCategory),
    );
  }

  factory MyTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MyTask(
      taskID: serializer.fromJson<int>(json['taskID']),
      taskTitle: serializer.fromJson<String>(json['taskTitle']),
      taskDesc: serializer.fromJson<String>(json['taskDesc']),
      taskCategory: serializer.fromJson<String>(json['taskCategory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'taskID': serializer.toJson<int>(taskID),
      'taskTitle': serializer.toJson<String>(taskTitle),
      'taskDesc': serializer.toJson<String>(taskDesc),
      'taskCategory': serializer.toJson<String>(taskCategory),
    };
  }

  MyTask copyWith(
          {int? taskID,
          String? taskTitle,
          String? taskDesc,
          String? taskCategory}) =>
      MyTask(
        taskID: taskID ?? this.taskID,
        taskTitle: taskTitle ?? this.taskTitle,
        taskDesc: taskDesc ?? this.taskDesc,
        taskCategory: taskCategory ?? this.taskCategory,
      );
  @override
  String toString() {
    return (StringBuffer('MyTask(')
          ..write('taskID: $taskID, ')
          ..write('taskTitle: $taskTitle, ')
          ..write('taskDesc: $taskDesc, ')
          ..write('taskCategory: $taskCategory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      taskID.hashCode,
      $mrjc(taskTitle.hashCode,
          $mrjc(taskDesc.hashCode, taskCategory.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyTask &&
          other.taskID == this.taskID &&
          other.taskTitle == this.taskTitle &&
          other.taskDesc == this.taskDesc &&
          other.taskCategory == this.taskCategory);
}

class TasksCompanion extends UpdateCompanion<MyTask> {
  final Value<int> taskID;
  final Value<String> taskTitle;
  final Value<String> taskDesc;
  final Value<String> taskCategory;
  const TasksCompanion({
    this.taskID = const Value.absent(),
    this.taskTitle = const Value.absent(),
    this.taskDesc = const Value.absent(),
    this.taskCategory = const Value.absent(),
  });
  TasksCompanion.insert({
    this.taskID = const Value.absent(),
    required String taskTitle,
    required String taskDesc,
    required String taskCategory,
  })  : taskTitle = Value(taskTitle),
        taskDesc = Value(taskDesc),
        taskCategory = Value(taskCategory);
  static Insertable<MyTask> custom({
    Expression<int>? taskID,
    Expression<String>? taskTitle,
    Expression<String>? taskDesc,
    Expression<String>? taskCategory,
  }) {
    return RawValuesInsertable({
      if (taskID != null) 'task_i_d': taskID,
      if (taskTitle != null) 'task_title': taskTitle,
      if (taskDesc != null) 'task_desc': taskDesc,
      if (taskCategory != null) 'task_category': taskCategory,
    });
  }

  TasksCompanion copyWith(
      {Value<int>? taskID,
      Value<String>? taskTitle,
      Value<String>? taskDesc,
      Value<String>? taskCategory}) {
    return TasksCompanion(
      taskID: taskID ?? this.taskID,
      taskTitle: taskTitle ?? this.taskTitle,
      taskDesc: taskDesc ?? this.taskDesc,
      taskCategory: taskCategory ?? this.taskCategory,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (taskID.present) {
      map['task_i_d'] = Variable<int>(taskID.value);
    }
    if (taskTitle.present) {
      map['task_title'] = Variable<String>(taskTitle.value);
    }
    if (taskDesc.present) {
      map['task_desc'] = Variable<String>(taskDesc.value);
    }
    if (taskCategory.present) {
      map['task_category'] = Variable<String>(taskCategory.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('taskID: $taskID, ')
          ..write('taskTitle: $taskTitle, ')
          ..write('taskDesc: $taskDesc, ')
          ..write('taskCategory: $taskCategory')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, MyTask> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _taskIDMeta = const VerificationMeta('taskID');
  late final GeneratedColumn<int?> taskID = GeneratedColumn<int?>(
      'task_i_d', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _taskTitleMeta = const VerificationMeta('taskTitle');
  late final GeneratedColumn<String?> taskTitle = GeneratedColumn<String?>(
      'task_title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _taskDescMeta = const VerificationMeta('taskDesc');
  late final GeneratedColumn<String?> taskDesc = GeneratedColumn<String?>(
      'task_desc', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _taskCategoryMeta =
      const VerificationMeta('taskCategory');
  late final GeneratedColumn<String?> taskCategory = GeneratedColumn<String?>(
      'task_category', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [taskID, taskTitle, taskDesc, taskCategory];
  @override
  String get aliasedName => _alias ?? 'tasks';
  @override
  String get actualTableName => 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<MyTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task_i_d')) {
      context.handle(_taskIDMeta,
          taskID.isAcceptableOrUnknown(data['task_i_d']!, _taskIDMeta));
    }
    if (data.containsKey('task_title')) {
      context.handle(_taskTitleMeta,
          taskTitle.isAcceptableOrUnknown(data['task_title']!, _taskTitleMeta));
    } else if (isInserting) {
      context.missing(_taskTitleMeta);
    }
    if (data.containsKey('task_desc')) {
      context.handle(_taskDescMeta,
          taskDesc.isAcceptableOrUnknown(data['task_desc']!, _taskDescMeta));
    } else if (isInserting) {
      context.missing(_taskDescMeta);
    }
    if (data.containsKey('task_category')) {
      context.handle(
          _taskCategoryMeta,
          taskCategory.isAcceptableOrUnknown(
              data['task_category']!, _taskCategoryMeta));
    } else if (isInserting) {
      context.missing(_taskCategoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {taskID};
  @override
  MyTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MyTask.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TasksTable tasks = $TasksTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}

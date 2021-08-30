import 'package:flutter/material.dart';
import 'package:todo_app/data/moor_database.dart';
import 'package:todo_app/login.dart';

AppDatabase? appDatabase;
void main() {
  appDatabase = AppDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My To-do App',
      home: Scaffold(body: login()),
    );
  }
}

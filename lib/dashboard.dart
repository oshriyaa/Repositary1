import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/moor_database.dart';
import 'package:todo_app/main.dart';

import 'package:todo_app/sidedrawer.dart';
import 'package:todo_app/taskcardwidget.dart';
import 'package:todo_app/taskdesc.dart';

import 'addtask.dart';
import 'edittask.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class StyleText {
  static const textStyle3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.orange,
  );
}

class _DashboardState extends State<Dashboard> {
  String? title;
  String? desc;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("object");
        bool? r = await Future.delayed(Duration.zero, () => false);
        return r!;
      },
      child: Scaffold(
        drawer: Drawer(
          child: sidedrawer(),
        ),
        appBar: AppBar(
          backgroundColor: Colors.amber.shade800,
          title: Text('My Lists'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildTaskList(context),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AddTask()));
          },
          tooltip: 'Click to add tasks',
          heroTag: "btn",
          child: Icon(Icons.add),
          backgroundColor: Colors.amber.shade800,
        ),
      ),
    );
  }

  StreamBuilder<List<MyTask>> _buildTaskList(BuildContext context) {
    appDatabase!.getAllTasks();
    return StreamBuilder<List<MyTask>>(
      initialData: [],
      stream: appDatabase!.watchAllTasks(),
      builder: (context, snapshot) {
        if (snapshot.data!.length == 0) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 250),
              child: Text(
                'No Tasks Added',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        }
        if (snapshot.hasData) {
          return ListView(
            shrinkWrap: true,
            children: snapshot.data!.map((e) {
              return TaskCardWidget(
                title: e.taskTitle,
                onselected: (i) async {
                  print(i);
                  if (i == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => taskdesc(
                                  title1: e.taskTitle,
                                  desc1: e.taskDesc,
                                  category1: e.taskCategory,
                                )));
                  }
                  if (i == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => edittask(
                                  myTask: e,
                                )));
                    // appDatabase!.tableUpdates()
                    // appDatabase!.updateTask(taskTi)
                    // appDatabase!.updateTask(Tasks).replace(MyTask);
                  }

                  if (i == 2) {
                    await appDatabase!.deleteTask(e.taskID);
                  }
                },
              );
            }).toList(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

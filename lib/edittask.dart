import 'package:flutter/material.dart';
import 'package:todo_app/taskdesc.dart';
import 'package:todo_app/textbutton.dart';
import 'package:moor/moor.dart' as moor;
import 'data/moor_database.dart';
import 'main.dart';

class edittask extends StatefulWidget {
  final MyTask? myTask;
  final String? boxlabel;
  final String? boxhint;
  final Function(String?)? onsubmitted;

  edittask({
    this.myTask,
    this.onsubmitted,
    this.boxlabel,
    this.boxhint,
  });

  @override
  _edittaskState createState() => _edittaskState();
}

class StyleText {
  static const textStyle1 = TextStyle(fontSize: 10);
  static const textStyle3 =
      TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
}

class _edittaskState extends State<edittask> {
  TextEditingController? controller;

  String? title;
  String? description;
  String? category;
  List<String?> _category = ['Travel', 'Personal', 'Life', 'Work', 'Other'];
  String? _selectedCategory = "";
  String newValue = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown.shade100,
        appBar: AppBar(
          backgroundColor: Colors.amber.shade800,
          title: Text('Edit Task'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 300,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          initialValue: widget.myTask!.taskTitle,
                          controller: controller,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            labelText: widget.boxlabel ?? 'lable',
                            hintText: widget.boxhint ?? 'hint',
                          ),
                          onSaved: (data) {
                            // print(data);
                            title = data;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 300,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          initialValue: widget.myTask!.taskDesc,
                          controller: controller,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            labelText: widget.boxlabel ?? 'lable',
                            hintText: widget.boxhint ?? 'hint',
                          ),
                          onSaved: (data) {

                            description = data;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Category'),
                      Container(
                        width: 300,
                        child: DropdownButtonFormField<String>(
                          dropdownColor: Colors.brown.shade300,
                          hint: Text('Please choose a category'),
                          value: widget.myTask!.taskCategory,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedCategory = newValue;
                            });
                          },
                          validator: (value) =>
                              value == null ? 'field required' : null,
                          items: _category.map((category) {
                            return DropdownMenuItem(
                              child: new Text(category!),
                              value: category,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 120,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Colors.orange.shade400,
                              padding: const EdgeInsets.all(10.0),
                              primary: Colors.black,
                              textStyle: const TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 120,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Colors.orange.shade400,
                              padding: const EdgeInsets.all(10.0),
                              primary: Colors.black,
                              textStyle: const TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                var updatedTask = TasksCompanion(
                                    taskID: moor.Value(widget.myTask!.taskID),
                                    taskTitle: moor.Value(title!),
                                    taskDesc: moor.Value(description!),
                                    taskCategory: moor.Value(
                                        _selectedCategory == ""
                                            ? widget.myTask!.taskCategory
                                            : _selectedCategory!));
                                print(updatedTask);
                                appDatabase!.updateTask(updatedTask);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Data added')),
                                );
                                Navigator.of(context).pop();
                              }
                            },
                            child: const Text('Update'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:moor/moor.dart' as moor;
import 'package:todo_app/main.dart';
import 'package:todo_app/textbutton.dart';
import 'data/moor_database.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class StyleText {
  static const textStyle1 = TextStyle(fontSize: 10);
  static const textStyle3 =
      TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
}

class _AddTaskState extends State<AddTask> {
  String? title;
  String? description;
  String? category;
  List<String?> _category = ['Travel', 'Personal', 'Life', 'Work', 'Other'];
  String? _selectedCategory;
  String newValue = '';
  final _formKey = GlobalKey<FormState>();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown.shade100,
        appBar: AppBar(
          backgroundColor: Colors.amber.shade800,
          title: Text('Add Task'),
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
                      addtextbutton(
                        boxlabel: 'Title',
                        boxhint: 'Enter title',
                        onsubmitted: (data) {
                          setState(() {
                            title = data;
                          });
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      addtextbutton(
                        boxlabel: 'Description',
                        boxhint: 'Enter description',
                        onsubmitted: (data) {
                          description = data;
                        },
                        // onSubmitted: (inputTitle){

                        // final task = MyTask(
                        //     name: inputName,
                        //   )
                        // }
                        // moor_database.insertTask(task);
                        // resetValuesAfterSubmit();
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
                          value: _selectedCategory,
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
                                var task = TasksCompanion(
                                    taskTitle: moor.Value(title!),
                                    taskDesc: moor.Value(description!),
                                    taskCategory:
                                        moor.Value(_selectedCategory!));
                                print(task);
                                appDatabase!.insertTask(task);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Data added')),
                                );
                                Navigator.of(context).pop();
                              }
                            },
                            child: const Text('Add'),
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
// void resetVluesAfterSubmit() {
//     setState(() {
//       controller?.clear();
//     });
//   }

}

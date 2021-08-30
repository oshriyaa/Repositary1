import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

class TaskCardWidget extends StatefulWidget {
  final String? title;
  final String? desc;
  final Function()? onpressed;
  final Function(int?)? onselected;
  TaskCardWidget({this.title, this.desc, this.onpressed, this.onselected});

  @override
  _TaskCardWidgetState createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text('Open'),
              value: 0,
            ),
            PopupMenuItem(
              child: Text('Edit'),
              value: 1,
            ),
            PopupMenuItem(
              child: Text('Delete'),
              value: 2,
            )
          ],
          onSelected: widget.onselected,
        ),
        title: Text(
          widget.title ?? 'Task',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
        ),
        
        subtitle: Text(widget.desc ?? 'Open to view more details.'),
        onTap: widget.onpressed,
        tileColor: Colors.brown.shade100,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
      ),
    );
  }
}

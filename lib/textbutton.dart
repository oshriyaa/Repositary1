import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/moor_database.dart';

class addtextbutton extends StatefulWidget {
  final String? boxlabel;
  final String? boxhint;
  final String? titleInput;
  final String? descInput;

  final Function(String?)? onsubmitted;
  addtextbutton({
    this.boxlabel,
    this.boxhint,
    this.titleInput,
    this.descInput,
    this.onsubmitted,
  });

  @override
  _addtextbuttonState createState() => _addtextbuttonState();
}

class _addtextbuttonState extends State<addtextbutton> {
  TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },

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
        onSaved: widget.onsubmitted,
      ),
    );
  }

 
}

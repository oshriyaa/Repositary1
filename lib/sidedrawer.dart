import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class sidedrawer extends StatefulWidget {
  sidedrawer({Key? key}) : super(key: key);

  @override
  _sidedrawerState createState() => _sidedrawerState();
}

class StyleText {
  static const textStyle3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.orange,
  );
}

class _sidedrawerState extends State<sidedrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.brown.shade100,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            AppBar(
              backgroundColor: Colors.amber.shade800,
              title: Text('Tasks'),
            ),
            ListTile(
              title: const Text('All Tasks'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('View Completed Tasks'),
              onTap: () {},
            ),
            Divider(
              color: Colors.amber.shade800,
              thickness: 2,
            ),
            Text(
              '   Category',
              style: StyleText.textStyle3,
            ),
            ListTile(
              title: const Text('Travel'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Personal'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Life'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Work'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Other'),
              onTap: () {},
            ),
            Divider(
              color: Colors.amber.shade800,
              thickness: 2,
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

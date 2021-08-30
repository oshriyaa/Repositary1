import 'package:flutter/material.dart';
import 'package:todo_app/textbutton.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade800,
        title: Text('Sign Up'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              addtextbutton(
                boxlabel: 'First Name',
                boxhint: 'Enter your first name',
              ),
              addtextbutton(
                boxlabel: 'Last Name',
                boxhint: 'Enter your last name',
              ),
              addtextbutton(
                boxlabel: 'Email',
                boxhint: 'Enter your email',
              ),
              addtextbutton(
                boxlabel: 'Password',
                boxhint: 'Enter your password',
              ),
              addtextbutton(
                boxlabel: 'Confirm Password',
                boxhint: 'Re-enter your password',
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
                          onPressed: () {},
                          child: const Text('Sign-up'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

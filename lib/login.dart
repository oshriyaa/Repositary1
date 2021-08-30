import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/dashboard.dart';
import 'package:todo_app/signup.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class StyleText {
  static const textStyle3 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: StyleText.textStyle3,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.brown.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        labelText: 'Username',
                        hintText: 'Enter your username'),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.brown.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        labelText: 'Password',
                        hintText: 'Enter your password'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.amber.shade900,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.amber.shade800,
                      padding: const EdgeInsets.all(10.0),
                      primary: Colors.black,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Dashboard()));
                    },
                    child: const Text('Login'),
                  ),
                ),
                Container(
                  
                  width: 300,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.amber.shade800,
                      padding: const EdgeInsets.all(10.0),
                      primary: Colors.black,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => signup()));
                    },
                    child: const Text('Sign-Up'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

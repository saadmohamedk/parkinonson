import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 10, 0),
                  //padding: EdgeInsets.fromLTRB(20, 0, 0,0 ),
                  child: Image(
                    image: AssetImage('images/login.jpg'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  //margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.fromLTRB(0, 10, 280, 0),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    leading : Icon(
                      Icons.email_outlined,
                      size: 20,
                    ),
                    title: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.fromLTRB(0, 10, 250, 0),
                  child: Text(
                    'password',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    leading : Icon(
                      Icons.lock_outline,
                      size: 20,
                    ),
                    title: Text(
                      'password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    trailing: Icon(
                      Icons.visibility_off,
                    ),
                  ),
                ),
                Container(
                  //margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.fromLTRB(220, 5, 20,0),
                  child: Text(
                    'forget password?',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Card(
                  color: Colors.teal,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      //margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.fromLTRB(75, 5, 20,10),
                      child: Center(
                        child: Text(
                          'Not have an account?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      //margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.fromLTRB(5, 5, 0,10),
                      child: Center(
                        child: Text(
                          'sign up',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

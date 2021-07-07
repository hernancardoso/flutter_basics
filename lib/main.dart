import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Scaffold(
            appBar: AppBar(
              title: Text("Ugly login screen"),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {}, child: Icon(Icons.arrow_forward)),
            body: LoginPage()));
  }
}

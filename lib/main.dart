import 'package:flutter/material.dart';

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
              title: Text("Yoa quea se"),
            ),
            floatingActionButton: FloatingActionButton(onPressed: () {}),
            body: _createBody()));
  }

  Widget _createBody() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          SizedBox(height: 20.0),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Password'),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Divider(
                      height: 20, thickness: 1, indent: 10, endIndent: 10)),
              Text(" OR "),
              Expanded(
                  child: Divider(
                      height: 20, thickness: 1, indent: 10, endIndent: 10)),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Text("FB"),
                radius: 30,
                backgroundColor: Colors.blueAccent,
              ),
              SizedBox(width: 20.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 1, color: Colors.black38),
                ),
                child: CircleAvatar(
                  child: Text(
                    "GL",
                    style: TextStyle(color: Colors.red),
                  ),
                  radius: 30,
                  backgroundColor: Colors.white,
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

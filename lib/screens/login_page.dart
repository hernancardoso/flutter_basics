import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _createBody(context),
    );
  }

  Widget _createBody(context) {
    FocusNode passwordFocus = new FocusNode();

    final content = Center(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height - 50,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(passwordFocus);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                focusNode: passwordFocus,
                obscureText: true,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 50.0),
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color: Colors.blue),
                    ),
                    child: CircleAvatar(
                      child: Text(
                        "FB",
                        style: TextStyle(color: Colors.blue),
                      ),
                      radius: 30,
                      backgroundColor: Colors.white,
                    ),
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
            ],
          ),
        ),
      ),
    );

    return Center(
      child: ListView(
        children: [content],
      ),
    );
  }
}

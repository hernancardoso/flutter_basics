import 'package:flutter/material.dart';
import 'package:newapp/navigation/navigation_drawer.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    /*
      Gesture detector is used here to dismiss the keyboard if 
      the user touched another part of the screen (not the input text)
    */
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login screen"),
        ),
        drawer: NavigationDrawer(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: Icon(Icons.arrow_forward)),
        body: _createBody(context),
      ),
    );
  }

  Widget _createBody(context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ..._formInputs(),
                SizedBox(height: 50.0),
                _orDisplay(),
                SizedBox(height: 20.0),
                _socialMediaLogin(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _formInputs() {
    return [
      TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
          prefixIcon: Icon(Icons.mail_outline, size: 20),
        ),
        textInputAction: TextInputAction.next,
      ),
      SizedBox(height: 20.0),
      TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
          prefixIcon: Icon(Icons.vpn_key, size: 20),
        ),
        obscureText: true,
        textInputAction: TextInputAction.next,
      )
    ];
  }

  Widget _orDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child:
                Divider(height: 20, thickness: 1, indent: 10, endIndent: 10)),
        Text(" OR "),
        Expanded(
            child:
                Divider(height: 20, thickness: 1, indent: 10, endIndent: 10)),
      ],
    );
  }

  Widget _socialMediaLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 1, color: Colors.black38),
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
    );
  }
}

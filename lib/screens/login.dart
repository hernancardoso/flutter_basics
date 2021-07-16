import 'package:flutter/material.dart';
import 'package:newapp/navigation/navigation_drawer.dart';
import 'package:newapp/providers/authentication.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _form = GlobalKey<FormState>();
  String email = "", password = "";

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
            onPressed: _saveForm, child: Icon(Icons.arrow_forward)),
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
                _formInputs(),
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

  Widget _formInputs() {
    return Form(
        key: _form,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                prefixIcon: Icon(Icons.mail_outline, size: 20),
              ),
              textInputAction: TextInputAction.next,
              onSaved: (email) => this.email = email.toString(),
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
              onSaved: (password) => this.password = password.toString(),
            )
          ],
        ));
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

  Future<void> _saveForm() async {
    //if (_form.currentState!.validate()) {
    _form.currentState!.save();
    Provider.of<Authentication>(context, listen: false).signIn(email, password);
    //}
  }
}

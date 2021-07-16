import 'package:flutter/material.dart';
import 'package:newapp/navigation/navigation_drawer.dart';
import 'package:newapp/providers/authentication.dart';
import 'package:newapp/widgets/password_form_field.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  static const routeName = "/register";
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = "", password = "";
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        drawer: NavigationDrawer(),
        floatingActionButton: FloatingActionButton(
            onPressed: _saveForm, child: Icon(Icons.arrow_forward)),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _form,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      validator: (value) =>
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!)
                              ? 'Enter a valid email'
                              : null,
                      decoration: InputDecoration(labelText: 'Email'),
                      textInputAction: TextInputAction.next,
                      onSaved: (email) => this.email = email.toString(),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Testing'),
                      textInputAction: TextInputAction.next,
                      onSaved: (_) {},
                    ),
                    PasswordFormField(
                      onSaved: (password) =>
                          this.password = password.toString(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveForm() async {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      Provider.of<Authentication>(context, listen: false)
          .signUp(email, password);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
  }
}

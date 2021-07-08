import 'package:flutter/material.dart';
import 'package:newapp/screens/hello.dart';
import 'package:newapp/screens/login.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushNamed('/hello');
            },
          ),
          ListTile(
            title: Text('Log in'),
            leading: Icon(Icons.login_outlined),
            onTap: () {
              Navigator.of(context).pushNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}

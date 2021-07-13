import 'package:flutter/material.dart';

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
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text('Hello'),
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
          ListTile(
            title: Text('Register'),
            leading: Icon(Icons.keyboard_alt),
            onTap: () {
              Navigator.of(context).pushNamed('/register');
            },
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newapp/navigation/navigation_drawer.dart';

class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
        ),
        drawer: NavigationDrawer(),
      ),
    );
  }
}

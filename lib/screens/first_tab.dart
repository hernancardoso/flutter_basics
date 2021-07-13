import 'package:flutter/material.dart';
import 'package:newapp/providers/estado.dart';
import 'package:provider/provider.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  var isEnabled = false;
  @override
  Widget build(BuildContext context) {
    final settingsState = Provider.of<Estado>(context);
    return Container(
      child: SwitchListTile.adaptive(
        value: settingsState.notifications,
        onChanged: (newValue) {
          setState(() => settingsState.notifications = newValue);
        },
        title: Text('Enable notifications'),
      ),
    );
  }
}

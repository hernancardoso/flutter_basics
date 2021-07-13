import 'package:flutter/material.dart';
import 'package:newapp/providers/estado.dart';
import 'package:provider/provider.dart';

class SecondTab extends StatelessWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsData = Provider.of<Estado>(context);
    return Container(
      child:
          Text("Second tab - Notifications are ${settingsData.notifications}"),
    );
  }
}

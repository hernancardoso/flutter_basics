import 'package:flutter/material.dart';
import 'package:newapp/navigation/navigation_drawer.dart';
import 'package:newapp/screens/second_tab.dart';

import 'first_tab.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  static const List<Map<String, dynamic>> _pages = [
    {'page': FirstTab(), 'label': 'First tab'},
    {'page': SecondTab(), 'label': 'Second tab'},
  ];

  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opciones'),
      ),
      drawer: NavigationDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        // backgroundColor: Theme.of(context).primaryColor,
        // selectedItemColor: Theme.of(context).bottomAppBarColor,
        // unselectedItemColor: Colors.white,
        //type: BottomNavigationBarType.shifting,
        currentIndex: _selectedPageIndex,
        items: _pages
            .map((pageItem) => BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarms),
                  label: pageItem['label'],
                ))
            .toList(),
      ),
      body: _pages[_selectedPageIndex]['page'],
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterswaystatemanagement/pages/inherited_model_page.dart';
import 'package:flutterswaystatemanagement/pages/inherited_widget_page.dart';
import 'package:flutterswaystatemanagement/pages/value_notifier_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List _listPages = List();
  Widget _currentPage;

  @override
  void initState() {
    super.initState();

    _listPages
      ..add(InheritedWidgetPage())
      ..add(InheritedModelPage())
      ..add(ValueNotifierPage());
    _currentPage = InheritedWidgetPage();
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  Color _selectedColor(int index) {
    if (index == 0) return Colors.lightGreen;
    if (index == 1) return Colors.blueGrey;
    if (index == 2) return Colors.orange;
    return Colors.lightGreen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: _selectedColor(_currentIndex),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_input_hdmi),
            title: Text('InheritedWidget'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb_outline),
              title: Text('InheritedModel'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.hearing),
              title: Text('ValueNotifier'),
          ),
        ],
        onTap: _changePage,
      ),
      body: _currentPage,
    );
  }
}


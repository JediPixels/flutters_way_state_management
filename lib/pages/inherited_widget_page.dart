import 'package:flutter/material.dart';
import 'package:flutterswaystatemanagement/classes/inherited_widget_page_provider.dart';
import 'package:flutterswaystatemanagement/pages/inherited_widget_bottom_page.dart';
import 'package:flutterswaystatemanagement/pages/inherited_widget_top_page.dart';

class InheritedWidgetPage extends StatefulWidget {
  @override
  _InheritedWidgetPageState createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  int _numberOfIdeas = 0;

  void _increaseNumberOfIdeas() {
    setState(() {
      _numberOfIdeas += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget'),
        backgroundColor: Colors.lightGreen,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add Ideas'),
            textColor: Colors.white,
            onPressed: _increaseNumberOfIdeas,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ParentWidget(numberOfIdeas: _numberOfIdeas),
            Expanded(
              child: InheritedWidgetPageProvider(
                numberOfIdeas: _numberOfIdeas,
                increaseNumberOfIdeas: _increaseNumberOfIdeas,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: InheritedWidgetTopPage(),
                      ),
                      Expanded(
                        child: InheritedWidgetBottomPage(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParentWidget extends StatelessWidget {
  final int _numberOfIdeas;

  const ParentWidget({
    Key key,
    @required int numberOfIdeas,
  }) : _numberOfIdeas = numberOfIdeas, super(key: key);

  @override
  Widget build(BuildContext context) {
    print('PARENT WIDGET');
    return Container(
      color: Colors.lightGreen.shade400,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(height: 16.0),
          Text('PARENT WIDGET'),
          Text(
            '$_numberOfIdeas',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade800),
          ),
        ],
      ),
    );
  }
}
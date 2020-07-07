import 'package:flutter/material.dart';
import 'package:flutterswaystatemanagement/classes/inherited_widget_page_provider.dart';

class InheritedWidgetTopPage extends StatefulWidget {
  @override
  _InheritedWidgetTopPageState createState() => _InheritedWidgetTopPageState();
}

class _InheritedWidgetTopPageState extends State<InheritedWidgetTopPage> {
  InheritedWidgetPageProvider _inheritedWidgetPageProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('TOP WIDGET: didChangeDependencies');
    _inheritedWidgetPageProvider = InheritedWidgetPageProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('TOP CHILD WIDGET'),
            InkWell(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Icon(
                    Icons.lightbulb_outline,
                    size: 184.0,
                    color: Colors.lightGreen.shade500,
                  ),
                  Positioned(
                    bottom: 84.0,
                    child: Text(
                      '${_inheritedWidgetPageProvider.numberOfIdeas}',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade800),
                    ),
                  ),
                ],
              ),
              onTap: _inheritedWidgetPageProvider.increaseNumberOfIdeas,
            ),
            Text('Ideas'),
          ],
        ),
      ),
    );
  }
}
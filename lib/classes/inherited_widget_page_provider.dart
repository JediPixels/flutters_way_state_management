import 'package:flutter/material.dart';

class InheritedWidgetPageProvider extends InheritedWidget {
  final int numberOfIdeas;
  final Function increaseNumberOfIdeas;

  InheritedWidgetPageProvider({
    Key key,
    this.numberOfIdeas,
    this.increaseNumberOfIdeas,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static InheritedWidgetPageProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedWidgetPageProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidgetPageProvider old) {
    return numberOfIdeas != old.numberOfIdeas;
  }
}
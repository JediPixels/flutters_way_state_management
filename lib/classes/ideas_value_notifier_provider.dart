import 'package:flutter/material.dart';
import 'ideas_value_notifier.dart';

class IdeasValueNotifierProvider extends InheritedWidget {
  final IdeasValueNotifier ideasValueNotifier;

  const IdeasValueNotifierProvider({
    Key key,
    this.ideasValueNotifier,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static IdeasValueNotifierProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<IdeasValueNotifierProvider>();
  }

  @override
  bool updateShouldNotify(IdeasValueNotifierProvider old) {
    return ideasValueNotifier != old.ideasValueNotifier;
  }
}
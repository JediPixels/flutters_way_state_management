import 'package:flutter/material.dart';
import 'idea_type.dart';

class IdeasInheritedModel extends InheritedModel<IdeaType> {
  final int numberOfIdeas;
  final int numberOfPossibilities;

  const IdeasInheritedModel({this.numberOfIdeas, this.numberOfPossibilities, Widget child}) : super(child: child);

  static IdeasInheritedModel of(BuildContext context, {IdeaType aspect}) {
    return InheritedModel.inheritFrom<IdeasInheritedModel>(context, aspect: aspect);
  }

  @override
  bool updateShouldNotify(IdeasInheritedModel oldWidget) {
    return numberOfIdeas != oldWidget.numberOfIdeas ||
        numberOfPossibilities != oldWidget.numberOfPossibilities;
  }

  @override
  bool updateShouldNotifyDependent(
      IdeasInheritedModel oldWidget, Set<IdeaType> dependencies) {
    return (dependencies.contains(IdeaType.ideas) &&
            numberOfIdeas != oldWidget.numberOfIdeas) ||
        (dependencies.contains(IdeaType.possibilities) &&
            numberOfPossibilities != oldWidget.numberOfPossibilities);
  }
}

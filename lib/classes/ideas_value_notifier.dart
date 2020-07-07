import 'package:flutter/material.dart';

class IdeaCount {
  ValueNotifier<int> numberOfIdeas = ValueNotifier<int>(0);
  ValueNotifier<int> numberOfPossibilities = ValueNotifier<int>(0);

  IdeaCount({this.numberOfIdeas, this.numberOfPossibilities});
}

class IdeasValueNotifier extends ValueNotifier<IdeaCount>{

  IdeasValueNotifier({IdeaCount value}) : super(value);

  void addNumberOfIdeas(int numberOfIdeas) {
    value.numberOfIdeas.value += numberOfIdeas;
    notifyListeners();
  }

  void addNumberOfPossibilities(int numberOfPossibilities) {
    value.numberOfPossibilities.value += numberOfPossibilities;
    notifyListeners();
  }
}

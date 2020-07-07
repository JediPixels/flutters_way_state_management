# Flutter's Way State Management
Flutter's Way State Management by using built-in Flutter classes.

## Video Tutorial
[YouTube Video](https://youtu.be/Dw6xGvzcF14)

[Blog](https://jedipixels.dev/flutters-way-state-management)

![](readmeassets/state-management-active.gif)

## What is covered
In this project, you are going to take a look at:
• How to use InheritedWidget to pass data from a parent (ancestor) widget to child (descendant) widgets in the widget tree
• How to use InheritedModel to selectively rebuild individual widgets for performance
• How to use ValueNotifier and ValueListenableBuilder to selectively rebuild individual widgets for performance

## InheritedWidget
  The `InheritedWidget` is immutable and allows child widgets to access data (state) above in the widget tree
  1. Create a class that extends `InheritedWidget`
  2. Add fields to contain data
  3. Add the `of()` method to access the InheritedWidget from child widgets
  4. Add the `updateShouldNotify()` method to notify (via Flutter framework) widgets to rebuild if the data changed

```dart
class InheritedProvider extends InheritedWidget {
  final int numberOfIdeas;
  final Function increaseNumberOfIdeas;

  InheritedProvider({
    Key key,
    this.numberOfIdeas,
    this.increaseNumberOfIdeas,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static InheritedProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedProvider>();

  @override
  bool updateShouldNotify(InheritedProvider old) {
    return numberOfIdeas != old.numberOfIdeas;
  }
}
```

## InheritedModel
  The InheritedModel allows to selectively rebuild individual widgets for performance
  1. Create a class that extends InheritedModel
  2. Add fields to contain data
  3. Add the of() method to access the InheritedModel from child widgets
  4. Add the updateShouldNotify() and updatedShouldNotifyDependent methods to notify (via Flutter framework) widgets to selectively rebuild if the data changed by individual field

```dart
class Ideas extends InheritedModel<IdeaType> {
  final int numberOfIdeas;
  final int numberOfPossibilities;

  const Ideas({this.numberOfIdeas, this.numberOfPossibilities, Widget child})
      : super(child: child);

  static Ideas of(BuildContext context, {IdeaType aspect}) {
    return InheritedModel.inheritFrom<Ideas>(context, aspect: aspect);
  }

  @override
  bool updateShouldNotify(Ideas oldWidget) {
    return numberOfIdeas != oldWidget.numberOfIdeas ||
        numberOfPossibilities != oldWidget.numberOfPossibilities;
  }

  @override
  bool updateShouldNotifyDependent(
      Ideas oldWidget, Set<IdeaType> dependencies) {
    return (dependencies.contains(IdeaType.ideas) &&
        numberOfIdeas != oldWidget.numberOfIdeas) ||
        (dependencies.contains(IdeaType.possibilities) &&
            numberOfPossibilities != oldWidget.numberOfPossibilities);
  }
}
```

## ValueNotifier & ValueListenableBuilder
  The ValueNotifier and ValueListenableBuilder allow to selectively rebuild individual widgets for performance
  1. Create a class that extends ValueNotifier
  2. Add fields to contain data defining them as ValueNotifier
  3. Add methods to modify data and call the notifyListeners() method
  4. Add the ValueListenableBuilder widget in the widget tree to rebuild widgets selectively if the data changed by individual field

```dart
class IdeaCount {
  ValueNotifier<int> numberOfIdeas = ValueNotifier<int>(0);
  ValueNotifier<int> numberOfPossibilities = ValueNotifier<int>(0);

  IdeaCount({this.numberOfIdeas, this.numberOfPossibilities});
}

class IdeasValueNotifier extends ValueNotifier<IdeaCount> {
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
```

## How it Works
- InheritedWidget – The InheritedWidget is great to pass data from an ancestor widget to descendent widget. The InheritedWidget is immutable and the data (attributes) are final (cannot change) and the Flutter framework rebuilds the InheritedWidget to refresh with new data.
- InheritedModel - The InheritedModel selectively rebuild individual widgets for performance. Use the of() method to access the InheritedModel from child widgets. The updateShouldNotify() and updatedShouldNotifyDependent() methods to notify (via Flutter framework) widgets to selectively rebuild if the data changed by individual field.
- ValueNotifier and ValueListenableBuilder - The ValueNotifier and ValueListenableBuilderallow to selectively rebuild individual widgets for performance. Use fields to contain data defining them as ValueNotifier. Use methods to modify data and call the notifyListeners() method. Use the ValueListenableBuilder widget in the widget tree to rebuild widgets selectively if the data changed by individual field.


## [License: MIT](LICENSE.md)

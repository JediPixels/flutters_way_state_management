import 'package:flutter/material.dart';
import 'package:flutterswaystatemanagement/classes/idea_type.dart';
import 'package:flutterswaystatemanagement/classes/ideas_inherited_model.dart';
import 'package:flutterswaystatemanagement/classes/log_provider.dart';
import 'LogHistory.dart';

class InheritedModelPage extends StatefulWidget {
  @override
  _InheritedModelPageState createState() => _InheritedModelPageState();
}

class _InheritedModelPageState extends State<InheritedModelPage> {
  int _numberOfIdeas = 0;
  int _numberOfPossibilities = 0;
  Log _log;

  @override
  void initState() {
    super.initState();
    _log = Log(logHistory: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Model'),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return LogProvider(
                      log: _log,
                      color: Colors.blueGrey,
                      child: LogHistory(),
                    );
                  })
              );
            },
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 100.0,
            child: IdeasInheritedModel(
              numberOfIdeas: _numberOfIdeas,
              numberOfPossibilities: _numberOfPossibilities,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: Column(
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.lightbulb_outline,
                              size: 184.0,
                              color: Colors.blueGrey.shade500,
                            ),
                            Positioned(
                              bottom: 84.0,
                              child: LogProvider(
                                log: _log,
                                child: const MyNumberOfIdeas(
                                  ideaType: IdeaType.ideas,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text('Ideas'),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        _numberOfIdeas += 1;
                      });
                    },
                  ),

                  InkWell(
                    child: Column(
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.notifications_none,
                              size: 184.0,
                              color: Colors.blueGrey.shade500,
                            ),
                            Positioned(
                              bottom: 62.0,
                              child: LogProvider(
                                log: _log,
                                child: const MyNumberOfPossibilities(
                                  ideaType: IdeaType.possibilities,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text('Possibilities')
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        _numberOfPossibilities += 1;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyNumberOfIdeas extends StatelessWidget {
  final IdeaType ideaType;

  const MyNumberOfIdeas({Key key, this.ideaType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IdeasInheritedModel _ideasTypeIdea = IdeasInheritedModel.of(context, aspect: ideaType);
    final Log _log = LogProvider.of(context).log;
    _log.logHistory += '\n$ideaType: ${_ideasTypeIdea.numberOfIdeas}';
    print('BUILD: $ideaType: ${_ideasTypeIdea.numberOfIdeas}');

    return Text(
      '${_ideasTypeIdea.numberOfIdeas}',
      style: Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey.shade800),
    );
  }
}

class MyNumberOfPossibilities extends StatelessWidget {
  final IdeaType ideaType;

  const MyNumberOfPossibilities({Key key, this.ideaType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IdeasInheritedModel _ideasTypeIdea = IdeasInheritedModel.of(context, aspect: ideaType);
    final Log _log = LogProvider.of(context).log;
    _log.logHistory += '\n$ideaType: ${_ideasTypeIdea.numberOfPossibilities}';
    print('BUILD: $ideaType: ${_ideasTypeIdea.numberOfPossibilities}');

    return Text(
      '${_ideasTypeIdea.numberOfPossibilities}',
      style: Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey.shade800),
    );
  }
}
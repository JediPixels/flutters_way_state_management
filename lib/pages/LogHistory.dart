import 'package:flutter/material.dart';
import 'package:flutterswaystatemanagement/classes/log_provider.dart';

class LogHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LogProvider logProvider = LogProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Log History'),
        backgroundColor: logProvider.color,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: ListTile(
              title: Text(logProvider.log.logHistory),
            ),
        ),
      ),
    );
  }
}
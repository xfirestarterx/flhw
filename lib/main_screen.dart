import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State {
  @override
  build(BuildContext ctx) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('blah blah'),
        ),
      ),
    );
  }
}

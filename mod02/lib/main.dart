import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'Random icons'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

const List<IconData> _iconsList = [
  Icons.ac_unit,
  Icons.account_circle,
  Icons.add_photo_alternate,
  Icons.arrow_back,
  Icons.assignment_turned_in,
  Icons.arrow_upward,
  Icons.border_outer,
  Icons.center_focus_weak,
  Icons.event_note,
  Icons.list,
];

class _HomeState extends State<Home> {
  static const _textSize = 18.0;
  String _customText = 'Your custom text';
  IconData _currentIcon = _iconsList[0];
  final _textEditingController = TextEditingController();

  final _drawer = Drawer(
    child: ListView(
      children: [
        for (int i = 1; i <= 3; i++)
          ListTile(
            leading: const Icon(Icons.chevron_right),
            title: Text('List Item $i'),
            onTap: () => print('Tapped $i'),
          ),
      ],
    ),
  );

  Widget _appBar() {
    return AppBar(
      title: Text(widget.title),
      leading: const Icon(Icons.account_circle),
    );
  }

  Widget _iconContainer() {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Icon(
        _currentIcon,
        color: Colors.white,
        size: 50,
      ),
    );
  }

  Widget _iconTitle() {
    return Text(
      widget.title,
      style: TextStyle(
        fontSize: _textSize,
      ),
    );
  }

  Widget _textFieldContainer() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            _customText,
            style: const TextStyle(fontSize: _textSize),
          ),
          TextField(
            controller: _textEditingController,
            enabled: true,
          ),
        ],
      ),
    );
  }

  Widget _actionButton() {
    return FloatingActionButton(
      child: const Icon(Icons.autorenew),
      onPressed: _updateCurrentIcon,
    );
  }

  void _updateCurrentIcon() {
    final index = Random().nextInt(10);
    setState(() => _currentIcon = _iconsList[index]);
  }

  @override
  initState() {
    _textEditingController
      ..text = _customText
      ..addListener(
          () => setState(() => _customText = _textEditingController.text));
    super.initState();
  }

  @override
  build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: _drawer,
        appBar: _appBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _iconContainer(),
              _iconTitle(),
              _textFieldContainer(),
            ],
          ),
        ),
        floatingActionButton: _actionButton(),
      ),
    );
  }
}

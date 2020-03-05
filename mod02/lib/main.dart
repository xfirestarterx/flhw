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
  _State createState() => _State();
}

class _State extends State<Home> {
  static const _textSize = 18.0;
  String _customText = 'Your custom text';

  static List<IconData> _iconsList = [
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

  IconData _currentIcon = _iconsList[0];

  final _drawer = Drawer(
    child: ListView(
      children: [
        for (int i = 1; i <= 3; i++)
          ListTile(
            leading: Icon(Icons.chevron_right),
            title: Text('List Item $i'),
            onTap: () => print('Tapped $i'),
          ),
      ],
    ),
  );

  Widget _appBar() {
    return AppBar(
      title: Text(widget.title),
      leading: Icon(Icons.account_circle),
    );
  }

  Widget _iconContainer() {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius: BorderRadius.all(
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
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            _customText,
            style: TextStyle(fontSize: _textSize),
          ),
          TextField(
              controller: TextEditingController(
                text: _customText,
              ),
              enabled: true,
              onChanged: (String curVal) {
                print('changed');
                setState(() => _customText = curVal);
              }),
        ],
      ),
    );
  }

  Widget _actionButton() {
    return FloatingActionButton(
      child: Icon(Icons.autorenew),
      onPressed: _updateCurrentIcon,
    );
  }

  void _updateCurrentIcon() {
    _iconsList.shuffle();
    setState(() => _currentIcon = _iconsList[0]);
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

import 'package:fl02/mapview.dart';
import 'package:fl02/webview.dart';
import 'package:flutter/material.dart';

// One main screen with 3 tabs:
// 1st - WebView with any web-page loaded
// 2nd - MapView with one market (random location)
// 3rd - VideoPlayer with any video in it.

class MainScreen extends StatelessWidget {
  static final _textStyle = TextStyle(color: Colors.blue);

  final _tabs = [
    Tab(child: Text('Webview', style: _textStyle)),
    Tab(child: Text('Mapview', style: _textStyle)),
    Tab(child: Text('Video', style: _textStyle)),
  ];

  final _tabViews = [
    CustomWebView(),
    Mapview(),
    Icon(Icons.directions_bike),
  ];

  @override
  build(BuildContext ctx) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: TabBar(
            tabs: _tabs,
          ),
          body: TabBarView(
            children: _tabViews,
          ),
        ),
      ),
    );
  }
}

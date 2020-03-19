import 'package:fl02/button.dart';
import 'package:fl02/models/user.dart';
import 'package:fl02/routes.dart';
import 'package:fl02/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstScreenState();
}

class _FirstScreenState extends State {
  User _currentUser;

  @override
  build(BuildContext ctx) {
    return WillPopScope(
      onWillPop: () => _onBackButton(ctx),
      child: Scaffold(
        body: Container(
          color: Colors.blue[700],
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _currentUser == null ? Container() : UserDetails(_currentUser),
                Button(
                  'Go to second screen',
                  onPressed: () => _onTapNextScreenButton(ctx),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapNextScreenButton(BuildContext ctx) async {
    final result = await Navigator.of(ctx).pushNamed(Routes.secondScreen);

    setState(() {
      _currentUser = result;
    });
  }

  Future<bool> _onBackButton(BuildContext ctx) {
    return showDialog(
      context: ctx,
      builder: (_) {
        return AlertDialog(
          title: Text('Confirm exit app'),
          actions: [
            MaterialButton(
              child: Text('No'),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
            MaterialButton(
              child: Text('Yes'),
              onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            ),
          ],
        );
      },
    );
  }
}

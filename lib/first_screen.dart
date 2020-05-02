import 'package:fl02/button.dart';
import 'package:fl02/models/user.dart';
import 'package:fl02/routes.dart';
import 'package:fl02/user_details.dart';
import 'package:flutter/material.dart';

import 'l10n.dart';

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
                  CustomLocalizations.of(ctx).goToSecondScreen,
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
          title: Text(CustomLocalizations.of(ctx).confirm),
          actions: [
            MaterialButton(
              child: Text(CustomLocalizations.of(ctx).no),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
            MaterialButton(
              child: Text(CustomLocalizations.of(ctx).yes),
              onPressed: () => Navigator.of(ctx).pop(true),
            ),
          ],
        );
      },
    );
  }
}

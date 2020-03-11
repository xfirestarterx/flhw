import 'package:fl02/first_screen.dart';
import 'package:fl02/routes.dart';
import 'package:fl02/second_screen.dart';
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
      initialRoute: Routes.firstScreen,
      routes: {
        Routes.firstScreen: (_) => FirstScreen(),
        Routes.secondScreen: (_) => SecondScreen()
      },
    );
  }
}

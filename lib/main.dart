import 'package:fl02/first_screen.dart';
import 'package:fl02/routes.dart';
import 'package:fl02/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n.dart';

void main() => runApp(MyApp());

// based on module 5 home task add localization with 2 languages (Eng + any one you choose)

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const CustomLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('ru'),
      ],
      onGenerateTitle: (BuildContext context) => CustomLocalizations.of(context).title,
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

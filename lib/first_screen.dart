import 'package:fl02/Button.dart';
import 'package:fl02/Routes.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  build(BuildContext ctx) {
    return Scaffold(
      body: Container(
        color: Colors.blue[700],
        child: Center(
          child: Button(
            'Go to second screen',
            onPressed: () async {
              final result =  await Navigator.of(ctx).pushNamed(Routes.secondScreen);

                showDialog(context: ctx, builder: (_) {
                  return AlertDialog(
                    title: Text(result.toString()),
                    actions: [
                      MaterialButton(
                        child: Text('Dismiss'),
                        onPressed: () => Navigator.of(ctx).pop(),
                      ),
                    ],
                  );
                });
            },
          ),
        ),
      ),
    );
  }
}

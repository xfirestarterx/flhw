import 'package:fl02/button.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  build(BuildContext ctx) {
    return Scaffold(
      body: Container(
        color: Colors.blue[700],
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Button(
                'Return 42',
                onPressed: () => Navigator.of(ctx).pop(42),
              ),
              Button(
                'Return AbErVaLlG',
                onPressed: () => Navigator.of(ctx).pop('AbErVaLlG'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

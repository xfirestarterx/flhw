import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final onPressed;
  final String _text;

  Button(this._text, { this.onPressed });

  @override
  build(BuildContext ctx) {
    return OutlineButton(
      onPressed: onPressed ?? null,
      child: Text(_text),
      textColor: Colors.white,
      borderSide: BorderSide(
        color: Colors.white,
      ),
      highlightedBorderColor: Colors.white,
    );
  }
}

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final onPressed;
  final String _text;

  // TODO
  // А почему именнованные аргументы не могут
  // начинаться с подчёркивания? Получается
  // они всегда будут публичными?
  Button(this._text, { this.onPressed }): super();

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

import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';

void _onWebviewControllerCreated(WebController webController) {
  webController.loadUrl("https://google.com");
}

class CustomWebView extends StatelessWidget {
  @override
  build(BuildContext ctx) {
    return const FlutterNativeWeb(
      onWebCreated: _onWebviewControllerCreated,
    );
  }
}

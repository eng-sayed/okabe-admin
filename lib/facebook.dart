import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:okpeadmin/main.dart';

Widget facebook() {
  return WebviewScaffold(
    clearCookies: false,
    clearCache: false,
    url: 'https://www.facebook.com/alfanaanhamdysalman',

    javascriptChannels: jsChannels,
    mediaPlaybackRequiresUserGesture: true,
    withZoom: true,
    withLocalStorage: true,
    hidden: true,
    withJavascript: true,
    primary: true,
    allowFileURLs: true,
    // withLocalUrl: true,
    scrollBar: false,
    appCacheEnabled: true,
    initialChild: Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'images/ph.jpg',
              scale: .5,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    ),
  );
}

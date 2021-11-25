import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:okpeadmin/main.dart';

Widget youtube() {
  String selectedUrl =
      'https://www.youtube.com/c/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9%D8%A7%D9%84%D8%B1%D8%B3%D9%85%D9%8A%D8%A9%D9%84%D9%84%D8%AD%D8%A7%D8%AC%D8%B9%D9%82%D8%A8%D9%8A';

  return SafeArea(
    child: WebviewScaffold(
      clearCookies: false,
      clearCache: false,
      url: selectedUrl,

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
    ),
  );
}

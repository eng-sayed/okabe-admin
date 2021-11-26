import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:okpeadmin/main.dart';

Widget facebook() {
    // return WebviewScaffold(
    //   bottomNavigationBar: Ads(),
    //
    //   clearCookies: false,
    //   clearCache: false,
    //   url: 'https://www.facebook.com/alfanaanhamdysalman',
    //
    //   javascriptChannels: jsChannels,
    //   mediaPlaybackRequiresUserGesture: true,
    //   withZoom: true,
    //   withLocalStorage: true,
    //   hidden: true,
    //   withJavascript: true,
    //   primary: true,
    //   allowFileURLs: true,
    //   // withLocalUrl: true,
    //   scrollBar: false,
    //   appCacheEnabled: true,
    //   initialChild: Container(
    //     color: Colors.white,
    //     child: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Image.asset(
    //             'images/ph.jpg',
    //             scale: .5,
    //           ),
    //           CircularProgressIndicator(),
    //         ],
    //       ),
    //     ),
    //   ),
    // );


    InAppWebViewController webViewController;

    Future<bool> _onWillPop(BuildContext context) async {
      if (await webViewController.canGoBack()) {
        webViewController.goBack();
        return Future.value(false);
      } else {
        return Future.value(true);
      }
    }
    return InAppWebView(
      // contextMenu: contextMenu,
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                'https://www.facebook.com/alfanaanhamdysalman'
              //
            )),
        // initialFile: "assets/index.html",
        initialUserScripts: UnmodifiableListView<UserScript>([]),
        onWebViewCreated: (controller) {
          webViewController = controller;
        });

}






class WebViewExample1 extends StatefulWidget {

  @override
  WebViewExample1State createState() => WebViewExample1State();
}
class WebViewExample1State extends State<WebViewExample1> {
  InAppWebViewController webViewController;

  Future<bool> _onWillPop(BuildContext context) async {
    if (await webViewController.canGoBack()) {
      webViewController.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  Widget splash = Container(
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
  );

  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: SafeArea(
          child: Stack(
            children: [
              InAppWebView(
                  onProgressChanged: (controller, progress) {
                    if (progress == 100) {
                      splash = SizedBox();
                      setState(() {});
                    }
                  },
                  // contextMenu: contextMenu,
                  initialUrlRequest: URLRequest(
                      url: Uri.parse( 'https://www.facebook.com/alfanaanhamdysalman'
                      )),
                  // initialFile: "assets/index.html",

                  onWebViewCreated: (controller) async {
                    webViewController = controller;
                  }),
              splash
            ],
          ),
        ),
      ),
    );
  }
}




//
// class WebViewExample extends StatefulWidget {
//
//   @override
//   WebViewExampleState createState() => WebViewExampleState();
// }
//
// class WebViewExampleState extends State<WebViewExample> {
//   InAppWebViewController webViewController;
//
//   Future<bool> _onWillPop(BuildContext context) async {
//     if (await webViewController.canGoBack()) {
//       webViewController.goBack();
//       return Future.value(false);
//     } else {
//       return Future.value(true);
//     }
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//      // bottomNavigationBar: Ads(),
//       body: WillPopScope(
//         onWillPop: () => _onWillPop(context),
//         child: SafeArea(
//           child: InAppWebView(
//             // contextMenu: contextMenu,
//               initialUrlRequest: URLRequest(
//                   url: Uri.parse(
//                       'https://www.youtube.com/c/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9%D8%A7%D9%84%D8%B1%D8%B3%D9%85%D9%8A%D8%A9%D9%84%D9%84%D8%AD%D8%A7%D8%AC%D8%B9%D9%82%D8%A8%D9%8A'
//                     //
//                   )),
//               // initialFile: "assets/index.html",
//               initialUserScripts: UnmodifiableListView<UserScript>([]),
//               onWebViewCreated: (controller) {
//                 webViewController = controller;
//               }),
//         ),
//       ),
//     );
//   }
// }

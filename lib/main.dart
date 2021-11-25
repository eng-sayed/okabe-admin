import 'dart:async';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'package:connectivity/connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:okpeadmin/adminchattest.dart';
import 'package:okpeadmin/chat_screen.dart';
import 'package:okpeadmin/constants.dart';
import 'package:okpeadmin/no_network.dart';
import 'package:okpeadmin/send_Notification.dart';
import 'package:okpeadmin/services/api.dart';
import 'package:okpeadmin/services/firebase.dart';
import 'package:okpeadmin/users.dart';
import 'package:okpeadmin/widgets.dart';
import 'package:okpeadmin/youtube_webview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Diohelp.init();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  token = await messaging.getToken();
  await messaging.subscribeToTopic('admin');

  notifacationHandel();
  FirebaseMessaging.onBackgroundMessage(firebaseonbackground);

  print(userName);
  print(token);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

// String selectedUrl = 'https://www.youtube.com/c/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9%D8%A7%D9%84%D8%B1%D8%B3%D9%85%D9%8A%D8%A9%D9%84%D9%84%D8%AD%D8%A7%D8%AC%D8%B9%D9%82%D8%A8%D9%8A';
final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  StreamSubscription<ConnectivityResult> internetconnection;
  bool isoffline = true;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  Widget ui = Scaffold();
  TabController tabController;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    internetconnection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // whenevery connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        setState(() {
          isoffline = true;
          ui = nonet(context);
        });
      } else if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        //connection is from wifi
        setState(() {
          isoffline = false;
          ui = youtube();
        });
      }
    });
    tabController = TabController(vsync: this, length: 3);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.mail,
        ),
        onPressed: () {
          scaffoldkey.currentState.showBottomSheet((context) {
            return SendNotification();
          });
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TabBar(
            controller: tabController,
            padding: EdgeInsets.zero,
            tabs: [
              Tab(text: "youtube"),
              Tab(text: "facebook"),
              Tab(text: "chat")
            ]),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                isoffline ? nonet(context) : chattest(),
                isoffline ? nonet(context) : Container(color: Colors.white),
                UsersList()
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.blue,
            child: Center(child: Text("حط الاعلان هنا")),
          )
        ],
      ),
    );
    // return Scaffold(
    //   // appBar: AppBar(
    //   //
    //   // ),
    //   drawer: Drawer(
    //     // Add a ListView to the drawer. This ensures the user can scroll
    //     // through the options in the drawer if there isn't enough vertical
    //     // space to fit everything.
    //     child: ListView(
    //       // Important: Remove any padding from the ListView.
    //       padding: EdgeInsets.zero,
    //       children: [
    //         const DrawerHeader(
    //           decoration: BoxDecoration(
    //             color: Colors.blue,
    //           ),
    //           child: Text('Drawer Header'),
    //         ),
    //         ListTile(
    //           title: const Text('Item 1'),
    //           onTap: () {
    //             // Update the state of the app.
    //             // ...
    //           },
    //         ),
    //         ListTile(
    //           title: const Text('Item 2'),
    //           onTap: () {
    //             // Update the state of the app.
    //             // ...
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    //   body:Container(child: ui)
    // );
  }
}


 /*   Container(
                child: Column(
                  children: [
                    TextField(
                      onSubmitted: (s) {
                        createUser(s, token);
                      },
                    ),
                    TextField(
                      onSubmitted: (s) {
                        sendMessege(types.User(id: "admin"), s, token);
                      },
                    ), */
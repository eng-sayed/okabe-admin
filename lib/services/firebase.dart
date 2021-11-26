import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:okpeadmin/constants.dart';
import 'package:okpeadmin/services/api.dart';
import 'package:okpeadmin/services/custom_user_model.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future createUser(String name, String token) {
  firestore.collection("users").doc(token).set(User(
          firstName: name,
          id: token,
          updatedAt: DateTime.now().millisecondsSinceEpoch,
          lastMessege: "")
      .toMap());
}

Future<String> getUserName(String token) async {
  var data =
      await FirebaseFirestore.instance.collection('users').doc(token).get();
  if (data.data() == null) {
    return "";
  } else {
    return data.data()["firstName"];
  }
}

Stream<QuerySnapshot> getChat(String token) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc("admin")
      .collection("chat")
      .doc(token)
      .collection("messeges")
      .orderBy("createdAt", descending: true)
      .snapshots();
}

Stream<QuerySnapshot> getUsers() {
  return FirebaseFirestore.instance
      .collection('users')
      .orderBy("updatedAt", descending: true)
      .snapshots();
}

sendMessege(types.User user, String msg, String to) {
  firestore
      .collection("users")
      .doc("admin")
      .collection("chat")
      .doc(to)
      .collection("messeges")
      .add(types.TextMessage(
              author: user,
              id: to,
              text: msg,
              createdAt: DateTime.now().millisecondsSinceEpoch)
          .toJson())
      .then((value) => Diohelp.postMessegeNotficarion(msg, "الحاج عقبي", to));
  /*  firestore.collection("users").doc(token).collection("messeges").add(
      types.TextMessage(
              author: user,
              id: to,
              text: msg,
              createdAt: DateTime.now().millisecondsSinceEpoch)
          .toJson()); */
}

changeSeen(token) {
  firestore.collection("users").doc(token).update({"seen": true});
}

notifacationHandel() {
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print(event.notification.body);
  });
  FirebaseMessaging.onMessage.listen((event) {
    print(event.notification.body);
  });
}

Future<void> firebaseonbackground(RemoteMessage message) async {
  print(message.notification.body);
}

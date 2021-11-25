import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:okpeadmin/constants.dart';
import 'package:okpeadmin/services/custom_user_model.dart';
import 'package:okpeadmin/services/firebase.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key, @required this.user}) : super(key: key);
  User user;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _user = const types.User(id: "admin");
  @override
  void initState() {
    // TODO: implement initState
    if (!widget.user.seen) changeSeen(widget.user.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.user.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: getChat(widget.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Chat(
              messages: snapshot.data.docs
                  .map((e) => types.Message.fromJson(e.data()))
                  .toList(),
              onSendPressed: (PartialText) {
                sendMessege(_user, PartialText.text, widget.user.id);
              },
              user: _user,
              showUserAvatars: true,
              theme: DefaultChatTheme(),
              showUserNames: true,
            );
          }),
    );
  }
}

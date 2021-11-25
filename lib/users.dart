import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:okpeadmin/chat_screen.dart';
import 'package:okpeadmin/datetime_handler.dart';
import 'package:okpeadmin/services/custom_user_model.dart';
import 'package:okpeadmin/services/firebase.dart';
import 'package:okpeadmin/widgets.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final list =
              snapshot.data.docs.map((e) => User.fromMap(e.data())).toList();
          return ListView.builder(
            itemBuilder: (context, index) {
              return listBuilder(list[index], context);
            },
            itemCount: list.length,
          );
        });
  }
}

ListTile listBuilder(User user, context) => ListTile(
      leading: CircleAvatar(),
      title: Text(user.firstName),
      subtitle: Text(user.lastMessege),
      trailing: Text(dateNow(user.updatedAt)),
      tileColor: user.seen ? Colors.transparent : Colors.blue.withOpacity(0.2),
      onTap: () {
        navto(ChatScreen(user: user), context);
      },
    );

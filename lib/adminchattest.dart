import 'package:flutter/material.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:okpeadmin/constants.dart';
import 'package:okpeadmin/services/firebase.dart';

class chattest extends StatelessWidget {
  const chattest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        onSubmitted: (s) {
          sendMessege(types.User(id: "admin"), s, token);
        },
      ),
    );
  }
}

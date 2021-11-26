// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:okpeadmin/services/api.dart';

import 'constants.dart';

class SendNotification extends StatefulWidget {
  SendNotification({Key key}) : super(key: key);

  @override
  _SendNotificationState createState() => _SendNotificationState();
}

class _SendNotificationState extends State<SendNotification> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Form(
        key: formkey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  validator: (s) {
                    if (s.isEmpty) {
                      return "Please Enter Your Name";
                    } else {
                      return null;
                    }
                  },
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Your Notification To Send"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton.extended(
                  heroTag: null,
                  onPressed: () async {
                    if (formkey.currentState.validate()) {
                      Diohelp.postMessegeNotficariontoAllUsers(controller.text);
                      Navigator.pop(context);
                    }
                  },
                  label: Text("Send Notification"))
            ],
          ),
        ),
      ),
    );
  }
}

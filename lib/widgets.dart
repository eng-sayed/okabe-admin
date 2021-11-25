import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

navto(Widget to, context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => to));
}

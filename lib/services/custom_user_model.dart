import 'dart:convert';

import 'package:flutter/material.dart';

class User {
  /// Creates a user.
  ///  String firstName,

  String lastMessege;
  int updatedAt;

  String id;
  bool seen;
  String firstName;
  User(
      {this.firstName,
      @required this.id,
      this.lastMessege,
      this.updatedAt,
      this.seen});

  Map<String, dynamic> toMap() {
    return {
      'lastMessege': lastMessege,
      'updatedAt': updatedAt,
      'id': id,
      'seen': seen,
      'firstName': firstName,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      lastMessege: map['lastMessege'],
      updatedAt: map['updatedAt'],
      id: map['id'],
      seen: map['seen'] ?? false,
      firstName: map['firstName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

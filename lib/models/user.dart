// ignore_for_file: empty_constructor_bodies, unused_import

import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
  });
}
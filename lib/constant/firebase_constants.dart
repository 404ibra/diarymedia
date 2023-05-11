import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  static final AuthService = FirebaseAuth.instance;
}

class FirebaseRef {
  static const FirebaseUsers = "Users";
}

class FirebaseCurrentUserService {
  static final uid = FirebaseAuth.instance.currentUser!.uid;
}

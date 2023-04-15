import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  static final AuthService = FirebaseAuth.instance;
}

class FirebaseRef {
  static const FirebaseUsers = "Users";
}

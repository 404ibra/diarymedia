import 'package:dia/views/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController mailController = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextField(
            controller: mailController,
          ),
          TextField(
            controller: password,
          ),
          ElevatedButton(
              onPressed: () {
                try {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: mailController.text, password: password.text)
                      .then((value) => Get.to(() => HomePage(),
                          transition: Transition.leftToRight));
                } catch (e) {
                  print(e);
                  Text(e.toString());
                }
              },
              child: Text("giriş yap"))
        ],
      ),
    );
  }
}

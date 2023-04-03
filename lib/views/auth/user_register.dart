import 'package:dia/widgets/auth/custom_textfield.dart';
import 'package:flutter/material.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Widget>[CustomTextField()],
      ),
    );
  }
}

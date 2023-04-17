import 'package:dia/constant/constants.dart';
import 'package:dia/view_model/user_inputs.dart';
import 'package:dia/widgets/navbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(),
      body: SafeArea(
        child: Column(
          children: const [
            Center(
              child: Text("sdkajdlksaj"),
            )
          ],
        ),
      ),
    );
  }
}

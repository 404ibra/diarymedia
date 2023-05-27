import 'package:flutter/material.dart';

class CustomDrawerMenu extends StatelessWidget {
  const CustomDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Row(
              children: [Icon(Icons.abc), Text("data")],
            ),
          )
        ],
      ),
    );
  }
}

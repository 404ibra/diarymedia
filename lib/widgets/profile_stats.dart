import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const <Widget>[
            Text(
              "Takipçi:",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            Text("404")
          ],
        ),
        Row(
          children: const <Widget>[
            Text(
              "Takip Edilen:",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            Text("88")
          ],
        ),
      ],
    );
  }
}

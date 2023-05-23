import 'package:flutter/material.dart';

import '../constant/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8, bottom: 4),
      child: SizedBox(
        height: 55,
        child: TextField(
          cursorColor: CustomColors.profileSecondoryColor,
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: const Icon(
              Icons.search,
              size: 25,
              color: CustomColors.profilePrimaryColor,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                    color: CustomColors.profileSecondoryColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                    width: 0.8, color: CustomColors.profileSecondoryColor)),
            hintText: "REM'de Keşfet",
          ),
        ),
      ),
    );
  }
}

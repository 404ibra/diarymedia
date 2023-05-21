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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: SizedBox(
        height: 60,
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
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: CustomColors.profileSecondoryColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    width: 1, color: CustomColors.profileSecondoryColor)),
            hintText: "Rutin veya Kullanıcı yazın",
          ),
        ),
      ),
    );
  }
}

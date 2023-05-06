import 'package:dia/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_bordered_button.dart';

class RoutineDetails extends StatelessWidget {
  RoutineDetails({super.key, required this.index});

  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: CustomPaddings.kHorizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: CustomColors.primaryPurple,
                      ),
                    ),
                    CustomBordererdButton(
                      buttonText: "Devam Et",
                      onTap: () {},
                    )
                  ]),
              const SizedBox(height: 15),
              Text(
                "Yeni Bir Okuma Rutini Oluştur",
                style: TextStyles.kHeadlineTextStyle.copyWith(fontSize: 20),
              ),
              const Text(
                "Rutin için ilk detayları paylaş",
                style: TextStyles.kTextStylePrimaryGrey,
              ),
              TextField(),
            ],
          ),
        ),
      ),
    );
  }
}

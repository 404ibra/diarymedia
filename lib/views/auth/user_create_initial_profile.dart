import 'package:dia/constant/constants.dart';
import 'package:dia/constant/custom_textstyles.dart';
import 'package:dia/view_model/user_inputs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateInitialProfile extends StatelessWidget {
  const CreateInitialProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 25),
          Padding(
            padding: CustomPaddings.kHorizontalPadding,
            child: Text(
              "createInitialProfileHeadlineText".tr(),
              style: TextStyles.kHeadlineTextStyle,
            ),
          ),
          Center(child: UserInputs.userName),
          const SizedBox(height: 25),
          Center(child: UserInputs.firstName),
          Center(child: UserInputs.lastName),
          SizedBox(
              height: 100,
              child: CupertinoDatePicker(
                  dateOrder: DatePickerDateOrder.dmy,
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime(2023, 2, 6),
                  minimumDate: DateTime(1881, 11, 10),
                  maximumDate: DateTime(2024, 2, 6),
                  onDateTimeChanged: (value) {}))
        ],
      ),
    );
  }
}

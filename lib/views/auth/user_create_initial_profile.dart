import 'package:dia/constant/constants.dart';
import 'package:dia/constant/custom_textstyles.dart';
import 'package:dia/view_model/create_init_profile_providers.dart';
import 'package:dia/view_model/user_inputs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateInitialProfile extends StatelessWidget {
  const CreateInitialProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final createInitProfProviders =
        Provider.of<CreateInitProfileProviders>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 25),
          Padding(
            padding: CustomPaddings.kHorizontalPadding,
            child: Text(
              "createInitialProfileHeadlineText".tr(),
              style: TextStyles.kHeadlineTextStyle,
            ),
          ),
          const SizedBox(height: 25),
          Center(child: UserInputs.firstName),
          const SizedBox(height: 25),
          Center(child: UserInputs.lastName),
          Row(
            children: [
              Checkbox(
                  activeColor: CustomColors.primaryGreen,
                  value: createInitProfProviders.birthdayCheckbox,
                  onChanged: (value) {
                    createInitProfProviders.changeBirthdayCheckbox();
                  }),
              Text(
                "createInitProfileBirthdayCheckbox".tr(),
                style: TextStyles.kTextStylePrimaryGrey,
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 130,
              child: CupertinoDatePicker(
                  dateOrder: DatePickerDateOrder.dmy,
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime(2023, 2, 6),
                  minimumDate: DateTime(1881, 11, 10),
                  maximumDate: DateTime(2024, 2, 6),
                  onDateTimeChanged: (value) {
                    createInitProfProviders.changeBirthday(value);
                  }))
        ],
      ),
    );
  }
}

import 'package:dia/constant/constants.dart';
import 'package:dia/view_model/create_init_profile_providers.dart';
import 'package:dia/view_model/user_inputs.dart';
import 'package:dia/views/auth/pick_profile_picture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
// TO DO BUG
import 'package:easy_localization/easy_localization.dart' as Translate;
import '../../widgets/large_elevated_button.dart';

class CreateInitialProfile extends StatelessWidget {
  const CreateInitialProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final createInitProfProviders =
        Provider.of<CreateInitProfileProviders>(context);
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: SizedBox(
          height: height,
          child: Column(
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
              const SizedBox(height: 45),
              Center(child: UserInputs.firstName),
              const SizedBox(height: 25),
              Center(child: UserInputs.lastName),
              const SizedBox(height: 70),
              Row(
                children: [
                  Checkbox(
                      activeColor: CustomColors.primaryPurple,
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
                      })),
              const Spacer(),
              LargeElevatedButton(
                buttonText: "letsContinue".tr(),
                onPressed: () {
                  // Get.to(() => PickProfilePicture());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

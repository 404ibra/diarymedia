import 'package:dia/constant/constants.dart';
import 'package:dia/view_model/create_init_profile_providers.dart';
import 'package:dia/view_model/user_inputs.dart';
import 'package:dia/views/auth/pick_profile_picture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' show Get;
import 'package:get/get.dart' show GetNavigation;
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
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
              Padding(
                padding: CustomPaddings.kHorizontalPadding,
                child: Text(
                  "createInitialProfileHeadlineText".tr(),
                  style: TextStyles.kHeadlineTextStyle,
                ),
              ),
              const Spacer(),
              const Padding(
                padding: CustomPaddings.kHorizontalPadding,
                child: Text(
                  "Name",
                  style: TextStyles.lHeadlineTextStyle,
                ),
              ),
              Padding(
                padding: CustomPaddings.kHorizontalPadding,
                child: Text(
                  "createInitialProfileNameDescription".tr(),
                  style: TextStyles.kTextStylePrimaryGrey,
                ),
              ),
              Center(child: UserInputs.firstName),
              const SizedBox(height: 30),
              const Spacer(),
              const Padding(
                padding: CustomPaddings.kHorizontalPadding,
                child: Text(
                  "User Birthday",
                  style: TextStyles.lHeadlineTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SizedBox(
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
              ),
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
              const Spacer(),
              LargeElevatedButton(
                buttonText: "letsContinue".tr(),
                onPressed: () {
                  Get.to(() => PickProfilePicture());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

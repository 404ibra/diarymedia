import 'dart:io';

import 'package:dia/view_model/pick_image.dart';
import 'package:dia/view_model/user_inputs.dart';
import 'package:dia/views/auth/select_username.dart';
import 'package:dia/widgets/large_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' show Get;
import 'package:get/get.dart' show GetNavigation;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../constant/constants.dart';

class PickProfilePicture extends StatelessWidget {
  PickProfilePicture({super.key});
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final pickedImageProvider = Provider.of<PickImageBoolenValue>(context);
    Future<void> addPhoto() async {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      pickedImageProvider.changePickedImagePath(pickedImage!.path);
    }

    return Scaffold(
      body: SafeArea(
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
            Padding(
              padding: CustomPaddings.kVerticalPadding,
              child: Center(
                child: InkWell(
                  onTap: () async {
                    addPhoto();
                    pickedImageProvider.changeImagePickedStatus();
                  },
                  child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: CustomColors.primaryPurple, width: 2)),
                      child: !pickedImageProvider.imagePicked ||
                              pickedImageProvider.anonymousProfilePhoto
                          ? const Icon(
                              Icons.person,
                              size: 90,
                              color: CustomColors.primaryGrey,
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(
                                  File(pickedImageProvider.pickedImagePath)))),
                ),
              ),
            ),
            const Padding(
              padding: CustomPaddings.kHorizontalPadding,
              child: Text(
                " Choose a photo for yourself and other users",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
                padding: CustomPaddings.kHorizontalPadding,
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        fillColor: const MaterialStatePropertyAll<Color>(
                            CustomColors.primaryPurple),
                        value: pickedImageProvider.anonymousProfilePhoto,
                        onChanged: (value) {
                          pickedImageProvider.changeAnonymousProfilePhoto();
                        }),
                    const Text(
                      "I want use with Anonymous profiel photo",
                      style: TextStyles.kTextStylePrimaryGrey,
                    ),
                  ],
                )),
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 16),
              child: Text(
                " Select Username",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: UserInputs.userName,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    " Your Gender",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  DropdownButton<String>(
                    hint: Text(pickedImageProvider.genderSelect),
                    items: <String>[
                      'Woman',
                      'Man',
                      'Other',
                      'Not want to specify'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      pickedImageProvider.changeGenderSelect(value!);
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            LargeElevatedButton(
              buttonText: "letsContinue".tr(),
              onPressed: () {
                Get.to(() => const CreateUsername());
              },
            ),
          ],
        ),
      ),
    );
  }
}

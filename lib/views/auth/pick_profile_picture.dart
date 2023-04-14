import 'dart:io';

import 'package:dia/view_model/pick_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../constant/constants.dart';

class PickProfilePicture extends StatelessWidget {
  PickProfilePicture({super.key});
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final pickedImageProvider = Provider.of<PickImageStage>(context);
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
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: pickedImageProvider.imagePicked
                          ? CircleAvatar(
                              backgroundImage: FileImage(
                                  File(pickedImageProvider.pickedImagePath)))
                          : const Icon(
                              Icons.person,
                              size: 120,
                              color: CustomColors.primaryGrey,
                            )),
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
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

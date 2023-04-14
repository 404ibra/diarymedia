import 'package:dia/view_model/pick_image_boolen.dart';
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
            InkWell(
              onTap: () async {
                addPhoto();
                pickedImageProvider.changeImagePickedStatus();
              },
              child: Container(
                height: 120,
                width: 120,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: pickedImageProvider.imagePicked
                    ? Icon(Icons.person)
                    : Image.file(pickedImageProvider.pickedImagePath),
              ),
            )
          ],
        ),
      ),
    );
  }
}

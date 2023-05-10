import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia/constant/constants.dart';
import 'package:dia/model/create_routine_model.dart';
import 'package:dia/model/routine_model.dart';
import 'package:dia/view_model/new_diary_viewmodels.dart';
import 'package:dia/view_model/new_routine_viewmodel.dart';
import 'package:dia/views/profile_page.dart';
import 'package:dia/widgets/routine_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../widgets/custom_bordered_button.dart';

class RoutineDetails extends StatelessWidget {
  RoutineDetails({super.key, required this.index});

  final _controller = TextEditingController();
  int index;
  String UUID = Uuid().v1();
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final routineDetailsVM = Provider.of<TopicsContainerProivder>(context);
    final newRoutineVM = Provider.of<NewRoutineViewModel>(context);
    Future<void> addPhoto() async {
      final XFile? response =
          await picker.pickImage(source: ImageSource.gallery);
      if (response != null) {
        newRoutineVM.newRoutineMainImage(response.path);

        return;
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                        buttonText: "Oluştur",
                        onTap: () async {
                          Get.to(() => const ProfilePage(),
                              transition: Transition.fadeIn);
                          final routine = RoutineModel(
                              routineId: UUID,
                              uid: FirebaseAuth.instance.currentUser?.uid ??
                                  "22",
                              routineCategorie: CreateRoutineCard.text[index],
                              routineStart: DateTime.now().toString(),
                              routineEnd:
                                  routineDetailsVM.routineEnd.toString(),
                              routineContent: _controller.text);

                          await FirebaseFirestore.instance
                              .collection("Routines")
                              .doc(UUID)
                              .set(routine.toJson());
                        },
                      )
                    ]),
                const SizedBox(height: 15),
                Text(
                  "Yeni Bir ${CreateRoutineCard.text[index].toLowerCase().capitalizeFirst} Rutini Oluştur",
                  style: TextStyles.kHeadlineTextStyle.copyWith(fontSize: 20),
                ),

                //TO DO detaylandırılacak text field
                TextField(
                  controller: _controller,
                  textInputAction: TextInputAction.newline,
                  maxLines: null,
                  maxLength: 300,
                  decoration: const InputDecoration(
                      hintText: "Oluşturacağın Rutin için detaylar ekle",
                      hintStyle: TextStyles.kTextStylePrimaryGrey,
                      border: InputBorder.none),
                ),

                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        addPhoto();
                      },
                      child: SizedBox(
                          height: 30,
                          width: 20,
                          child: Image.asset(
                              "assets/icons/routine_details_add_photo.png")),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                          height: 30,
                          width: 25,
                          child:
                              Image.asset("assets/icons/routine_details.png")),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                          height: 30,
                          width: 22,
                          child: Image.asset("assets/icons/location.png")),
                    ),
                  ],
                ),
                const Divider(),
                Text(
                  "Rutin Kapağı",
                  style: TextStyles.kHeadlineTextStyle
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Keşfet ve anasayfada rutininiz kapak fotoğrafı bu olacak",
                  style:
                      TextStyles.kTextStylePrimaryGrey.copyWith(fontSize: 14),
                ),

                Center(
                  child: InkWell(
                    onTap: () {
                      addPhoto();
                    },
                    child: SizedBox(
                        height: size.height / 2.4,
                        width: size.width / 2,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: newRoutineVM.routineMainImagePath == null
                                  ? Image.asset(
                                      "assets/images/books_img.jpeg",
                                      opacity:
                                          const AlwaysStoppedAnimation(.65),
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      File(newRoutineVM.routineMainImagePath!),
                                      fit: BoxFit.cover,
                                      opacity:
                                          const AlwaysStoppedAnimation(0.95),
                                    ),
                            ),
                            Center(
                              child: ShaderMask(
                                shaderCallback: (bounds) =>
                                    const LinearGradient(colors: [
                                  Color(0xfffa7cdc8),
                                  Color(0xfffaeb9ce),
                                ]).createShader(bounds),
                                child: newRoutineVM.selectedImagePath == false
                                    ? Text(
                                        "+",
                                        style: TextStyle(
                                            fontSize: 120,
                                            color:
                                                Colors.white.withOpacity(0.95)),
                                      )
                                    : null,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 8),
                  child: Text(
                    "Rutin Tarihleri",
                    style: TextStyles.kHeadlineTextStyle
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    selectedDayHighlightColor:
                        CustomColors.primaryPurple.withOpacity(0.6),
                    firstDate: DateTime.now(),
                    calendarType: CalendarDatePicker2Type.range,
                  ),
                  value: [DateTime.now(), routineDetailsVM.routineEnd],
                  onValueChanged: (dates) {
                    if (dates.length == 2) {
                      routineDetailsVM.changeRoutineDates(dates[0]!, dates[1]!);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

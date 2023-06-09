import 'package:dia/constant/constants.dart';
import 'package:dia/constant/custom_colors.dart';
import 'package:dia/model/create_routine_model.dart';
import 'package:dia/view_model/new_diary_viewmodels.dart';
import 'package:dia/views/new_diary/routine_details.dart';
import 'package:dia/widgets/custom_bordered_button.dart';
import 'package:dia/widgets/diary_topics_container.dart';
import 'package:dia/widgets/routine_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class NewDiary extends StatelessWidget {
  const NewDiary({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final routineCardVM = Provider.of<TopicsContainerProivder>(context);
    DateTime todayDate = DateTime.now();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                        onTap: () {
                          Get.to(
                              () => RoutineDetails(
                                  index: routineCardVM.selectedIndex),
                              transition: Transition.fadeIn);
                        },
                      )
                    ]),
                const SizedBox(height: 10),
                Text(
                  "${todayDate.day.toString()} Mayıs Pzt",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                //Color(0xfffe7d1d5
                //"assets/images/wash_face_img.png"
                const Text(
                  "İstedğin konuda mükemmeleşmenin yarısını tamamladın sayılır, mükemmelleşmek istediğin başlığı seç ve devam et",
                  style: TextStyle(
                      color: CustomColors.profileSecondoryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: CreateRoutineCard.bgImage.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemBuilder: (context, index) {
                      return RoutineCard(
                          size: size,
                          index: index,
                          backgroundImage: CreateRoutineCard.bgImage[index],
                          textColor: CreateRoutineCard.textColor[index],
                          routineText: CreateRoutineCard.text[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DiaryTopicList extends StatelessWidget {
  const DiaryTopicList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 34,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            DiaryTopicsContainer(
              topicColor: Colors.red,
              topicIcon: Icons.list_rounded,
              topicText: "Gündem",
              topicIndex: TopicNames.Agenda.index,
            ),
            DiaryTopicsContainer(
              topicColor: Colors.green.shade700,
              topicIcon: Icons.face,
              topicText: "Bakım",
              topicIndex: TopicNames.Beauty.index,
            ),
            DiaryTopicsContainer(
              topicColor: Colors.orange.shade800,
              topicIcon: Icons.sports_basketball,
              topicText: "Spor",
              topicIndex: TopicNames.Sport.index,
            ),
            DiaryTopicsContainer(
              topicColor: Colors.blue.shade800,
              topicIcon: Icons.book,
              topicText: "Eğitim",
              topicIndex: TopicNames.Education.index,
            ),
          ],
        ),
      ),
    );
  }
}

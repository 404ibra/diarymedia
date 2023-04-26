import 'package:dia/constant/constants.dart';
import 'package:dia/constant/custom_colors.dart';
import 'package:dia/view_model/new_diary_viewmodels.dart';
import 'package:dia/widgets/custom_bordered_button.dart';
import 'package:dia/widgets/diary_topics_container.dart';
import 'package:flutter/material.dart';

class NewDiary extends StatelessWidget {
  const NewDiary({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Icon(
                      Icons.arrow_back,
                      color: CustomColors.primaryPurple,
                    ),
                    CustomBordererdButton(
                      buttonText: "Oluştur",
                    )
                  ]),
              const SizedBox(height: 10),
              const Text(
                "24 Nisan Pzt",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              Padding(
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
              ),
              Column(
                children: [
                  SizedBox(
                    width: size.width,
                    child: const TextField(
                      cursorColor: CustomColors.primaryPurple,
                      maxLength: 404,
                      maxLines: 10,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Gündem için bugün neler yazacaksın ? ",
                          hintStyle: TextStyle(
                              color: CustomColors.primaryPurple, fontSize: 15)),
                    ),
                  ),
                ],
              ),
              DiaryTopicsContainer(
                topicColor: Colors.red,
                topicIcon: Icons.list_rounded,
                topicText: "Gündem",
                topicIndex: TopicNames.Agenda.index,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

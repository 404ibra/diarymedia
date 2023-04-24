import 'package:dia/view_model/new_diary_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiaryTopicsContainer extends StatelessWidget {
  DiaryTopicsContainer(
      {super.key,
      required this.topicColor,
      required this.topicIcon,
      required this.topicText,
      required this.topicIndex});

  final String topicText;
  IconData topicIcon;
  Color topicColor;
  int topicIndex;

  @override
  Widget build(BuildContext context) {
    final newDiaryViewModel = Provider.of<TopicsContainerProivder>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: () {
          if ([
            TopicNames.Agenda,
            TopicNames.Beauty,
            TopicNames.Sport,
            TopicNames.Education
          ].contains(TopicNames.values[topicIndex])) {
            newDiaryViewModel.changeTopicColor(topicIndex);
            print(newDiaryViewModel.selectedTopics);
          }
        },
        child: Container(
          height: 25,
          width: 125,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 0.2,
                blurRadius: 1,
              )
            ],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 0.5, color: topicColor),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  topicIcon,
                  color: topicColor,
                ),
                Text(
                  topicText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

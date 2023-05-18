import 'package:dia/view_model/routine_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoutineOwnerHeadline extends StatelessWidget {
  const RoutineOwnerHeadline({
    super.key,
    required this.data,
  });

  final data;

  @override
  Widget build(BuildContext context) {
    final routineVM = Provider.of<RoutineViewModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 8),
              child: CircleAvatar(
                radius: 17,
                backgroundImage: AssetImage("assets/images/wash_face_img.png"),
              ),
            ),
            routineVM.RoutineHeaderUserInformation(data)
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: SizedBox.square(
                dimension: 20, child: Image.asset("assets/images/dots.png")))
      ],
    );
  }
}

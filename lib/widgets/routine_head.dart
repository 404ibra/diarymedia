import 'package:dia/view_model/routine_view.dart';
import 'package:dia/views/routine_view.dart';
import 'package:flutter/material.dart';

import '../constant/constants.dart';

class RoutineHead extends StatelessWidget {
  RoutineHead({
    super.key,
    required this.routineVM,
    required this.data,
    required this.size,
  });

  final RoutineViewModel routineVM;
  var data;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1200),
      curve: Curves.ease,
      height: routineVM.currentHeight,
      decoration: BoxDecoration(
          color: const Color(0xffffafcfe),
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10)
          ]),
      child: routineVM.aniamatedStarted == false
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                routineVM.RoutineHeaderUserInformation(data),
                const Padding(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 16, top: 8, bottom: 10),
                  child: Text(
                    "IMDB +9.0 Filmleri İzliyoruz",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: CustomColors.profilePrimaryColor,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 16, right: 16),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: size.height / 3.2,
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 1,
                                spreadRadius: 0.5,
                              )
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            data['routine_cover_image_path'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        data['routine_categorie'],
                        style: TextStyle(
                            letterSpacing: 3,
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            shadows: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  offset: const Offset(1, 1))
                            ]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const <Widget>[
                          Icon(Icons.bookmark_border_rounded),
                        ],
                      ),
                      Column(
                        children: const <Widget>[
                          Icon(Icons.favorite_border_rounded),
                        ],
                      ),
                      Column(
                        children: const <Widget>[
                          Icon(Icons.mode_comment_outlined),
                        ],
                      ),
                      Column(
                        children: const <Widget>[Icon(Icons.share)],
                      ),
                    ],
                  ),
                ),
              ],
            )
          : null,
    );
  }
}

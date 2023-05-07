import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dia/constant/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_bordered_button.dart';

class RoutineDetails extends StatelessWidget {
  RoutineDetails({super.key, required this.index});

  int index;

  @override
  Widget build(BuildContext context) {
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
                        buttonText: "Devam Et",
                        onTap: () {},
                      )
                    ]),
                const SizedBox(height: 15),
                Text(
                  "Yeni Bir Okuma Rutini Oluştur",
                  style: TextStyles.kHeadlineTextStyle.copyWith(fontSize: 20),
                ),

                //TO DO detaylandırılacak text field
                const TextField(
                  textInputAction: TextInputAction.newline,
                  maxLines: null,
                  maxLength: 300,
                  decoration: InputDecoration(
                      hintText: "Oluşturacağın Rutin için detaylar ekle",
                      hintStyle: TextStyles.kTextStylePrimaryGrey,
                      border: InputBorder.none),
                ),

                InkWell(
                  onTap: () {},
                  child: SizedBox(
                      height: 30,
                      width: 20,
                      child: Image.asset(
                          "assets/icons/routine_details_add_photo.png")),
                ),
                Text(
                  "Rutin Süresi",
                  style: TextStyles.kHeadlineTextStyle
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    firstDate: DateTime(2023, 1, 1),
                    calendarType: CalendarDatePicker2Type.range,
                  ),
                  value: [],
                  onValueChanged: (dates) {
                    if (dates.length == 2) {
                      print(dates[0]);
                      print(dates[1]);
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

import 'package:dia/constant/constants.dart';
import 'package:dia/constant/custom_colors.dart';
import 'package:flutter/material.dart';

class NewDiary extends StatelessWidget {
  const NewDiary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Icon(
                      Icons.arrow_back,
                      color: CustomColors.primaryPurple,
                    ),
                    Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 0.2,
                            blurRadius: 1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 1, color: CustomColors.primaryPurple),
                        color: Colors.white,
                      ),
                      child: const Center(child: Text("Oluştur")),
                    )
                  ]),
              const SizedBox(height: 10),
              const Text(
                "24 Nisan Pzt",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}

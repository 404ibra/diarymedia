import 'package:dia/constant/constants.dart';
import 'package:dia/widgets/navbar.dart';
import 'package:flutter/material.dart';

class DailyRoutine extends StatelessWidget {
  const DailyRoutine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: DiaryHeadline(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: Text(
            "Merhaba bugün cilt bakımım için yaptığım rutinde 44.gündeyim yüzümün yeni hali ekte. Kullandığım ürün xx. Gerçekten hepinize tavsitye ederim sorularınız varsa muhakkak yorumlarda sorun süreci tamamen görmek istiyorsnaız profilime girmeniz yeterli...",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w300, fontSize: 14),
          ),
        ),
        DiaryBotline(),
        Divider()
      ],
    );
  }
}

class DiaryBotline extends StatelessWidget {
  const DiaryBotline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.mode_comment_outlined),
              style: ButtonStyle(),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
              style: ButtonStyle(),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.bookmark_border_outlined),
              style: ButtonStyle(),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert_rounded),
          style: ButtonStyle(),
        ),
      ],
    );
  }
}

class DiaryHeadline extends StatelessWidget {
  const DiaryHeadline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    "https://xsgames.co/randomusers/assets/avatars/pixel/6.jpg")),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "İbrahim Aktaş",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "@ibrahim",
                    style: TextStyle(
                        color: CustomColors.primaryGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            )
          ],
        ),
        const Text(
          "21 Nisan 2023",
          style: TextStyle(
            color: CustomColors.primaryGrey,
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}

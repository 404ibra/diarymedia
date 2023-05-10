import 'package:dia/constant/custom_colors.dart';
import 'package:dia/view_model/appbar_viewmodel.dart';
import 'package:dia/widgets/custom_appbar.dart';
import 'package:dia/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: const NavBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: CustomAppbar(
          leftTitle: "Keşfet",
          rightTitle: "Ana Sayfa",
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {},
                    child: Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image.network(
                              posts[index].imageUrl,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              height: 30,
                              width: size.width / 2,
                              color: Colors.white60,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 3.0, horizontal: 10),
                                    child: CircleAvatar(
                                      radius: 13,
                                      backgroundImage: AssetImage(
                                          "assets/images/wash_face_img.png"),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "ibra",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "88.Gün",
                                        style: TextStyle(
                                            color: CustomColors
                                                .profilePrimaryColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  );
                })));
  }
}

class Post {
  final String id;
  final String imageUrl;
  final String title;

  Post(
    this.id,
    this.imageUrl,
    this.title,
  );
}

final List<Post> posts = [
  Post(
    'id0',
    'https://images.unsplash.com/photo-1568890686150-64af65720e69?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    'Spiderman wall art',
  ),
  Post(
    'id1',
    'https://images.unsplash.com/photo-1634828221818-503587f33d02?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1665&q=80',
    'Comic book collection',
  ),
  Post(
    'id2',
    'https://images.unsplash.com/photo-1596727147705-61a532a659bd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNvbWljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
    'Powerful Baby Groot',
  ),
  Post(
    'id3',
    'https://images.unsplash.com/photo-1611604548018-d56bbd85d681?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
    'DC best friends',
  ),
  Post(
    'id4',
    'https://images.unsplash.com/photo-1624562563808-170065db4fcc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
    'Spiderman in action',
  ),
  Post(
    'id5',
    'https://images.unsplash.com/photo-1534809027769-b00d750a6bac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    'Will he save Gwen?',
  ),
  Post(
    'id6',
    'https://images.unsplash.com/photo-1601645191163-3fc0d5d64e35?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80',
    'Collector Edition',
  ),
  Post(
    'id7',
    'https://images.unsplash.com/photo-1569003339405-ea396a5a8a90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y29taWN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
    'Captain America strikes',
  ),
  Post(
    'id8',
    'https://images.unsplash.com/photo-1531259683007-016a7b628fc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fGNvbWljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
    'The Dark Knight',
  ),
  Post(
    'id9',
    'https://images.unsplash.com/photo-1608889175250-c3b0c1667d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fGNvbWljJTIwc3VwZXJtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
    'Snap snap',
  ),
];

final List<Post> sharePosts = [
  Post(
    'Message',
    'message.png',
    '',
  ),
  Post(
    'WhatsApp',
    'whatsapp.png',
    '',
  ),
  Post(
    'Messenger',
    'messenger.png',
    '',
  ),
  Post(
    'Messages',
    'messages.png',
    '',
  ),
  Post(
    'Facebook',
    'facebook.png',
    '',
  ),
];

import 'package:flutter/material.dart';
import 'package:muchmelody/utils/colors.dart';

import '../screen/post_card.dart';

class ScrollFeed extends StatelessWidget {
  ScrollFeed({Key? key}) : super(key: key);
  final _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active_outlined, size: 35.0),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active_outlined, size: 35.0),
          ),
        ],
      ),

    body: PostCard(),




    );
  }
}

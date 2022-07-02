import 'package:flutter/material.dart';
import 'package:muchmelody/utils/colors.dart';
import '../widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

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

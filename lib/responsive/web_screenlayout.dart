import 'package:flutter/material.dart';
import 'package:muchmelody/screen/message_screen.dart';

import '../screen/grid_feed_screen.dart';
import '../utils/colors.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GridFeedScreen(),
                ),
              );
            },
            icon: Icon(Icons.auto_awesome_mosaic, size: 25.0),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MessageScreen(),
                ),
              );
            },
            icon: Icon(Icons.archive, size: 25.0),
          ),
        ],
      ),
      body : Center(child: Text("this is Web")),

    );
  }
}

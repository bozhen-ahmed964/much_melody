import 'package:flutter/material.dart';
import 'package:muchmelody/utils/colors.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          //page title here
          title: Text('Feeds'),
          //app icon here
          leading: Image.network(
              'https://www.kindpng.com/picc/m/220-2201160_line-clipart-computer-icons-social-media-facebook-small.png'),
          //notification icon here
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_on_outlined),),
          ],
        ),
       
      ),
    );
  }
}

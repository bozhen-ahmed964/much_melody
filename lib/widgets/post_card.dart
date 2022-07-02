import 'package:flutter/material.dart';
import '../utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      'https://d.newsweek.com/en/full/1604681/ewan-mcgregor.jpg?w=1600&h=1600&l=48&t=42&q=88&f=abe3ca0eea75ab14d618465ea399cf6f'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // delete button
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shrinkWrap: true,
                          children: [
                            'Delete',
                          ]
                              .map(
                                (e) => InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 16),
                                    child: Text(e),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.more_horiz, size: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          // posted image
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
                'https://media.gq.com.mx/photos/6260479eb6a67eb4f0c2ebca/2:3/w_1452,h_2178,c_limit/star%20wars.jpg',
                fit: BoxFit.cover),
          ),

          // Functional buttons
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite, color: Colors.white, size: 26),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.comment, color: Colors.white, size: 26),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.send_sharp, color: Colors.white, size: 26),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.bookmark, color: Colors.white, size: 26),
              ),
            ],
          ),

          //description part here
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1.225 likes',
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 8),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: primaryColor),
                        children: [
                          TextSpan(
                            text: 'username : ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                ' this is lorem ipsum chris redfield g bossssss',
                          )
                        ],
                      ),
                    ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text('View All 200 Comments',
                        style : const TextStyle(fontSize : 14 , color : secondaryColor),
                        ),
                      ),
                    ),
                    Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '27/6/2022',
                    style: const TextStyle(fontSize: 14, color: secondaryColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

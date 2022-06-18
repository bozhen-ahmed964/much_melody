import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: IconButton(
    //     iconSize: 50.5,
    //   alignment: Alignment.center,
    //     icon : const Icon(
    //       Icons.add_circle_outline,
    //     ),
    //      onPressed: (){},
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Add Post '),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Post',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  fontSize: 18.0),
            ),
          ),
        ],
      ),
    
      body: Column(
        children: [
        SizedBox(height : 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                maxRadius: 45.0,
                backgroundImage: NetworkImage(
                  'https://images.squarespace-cdn.com/content/v1/52d311f2e4b0c7203219d1cd/1442603504686-79XLZIZNAFA0E61GP4LX/image-asset.jpeg?format=1000w',
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Write description....',
                    border: InputBorder.none,
                  ),
                  maxLines: 6,
                ),
              ),
            ],
          ),
          SizedBox(
              height: 500,
              width: 400,
              child: AspectRatio(
                aspectRatio: 487 / 451,
                child: Container(
                  decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 2,
                       color: Color.fromARGB(255, 0, 0, 0)
                  
                       ),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXeqORuwKOneTrpAP08NcUp2sWVZyBA-uAZw&usqp=CAU'),
                      fit: BoxFit.cover,
                      alignment: FractionalOffset.topCenter,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

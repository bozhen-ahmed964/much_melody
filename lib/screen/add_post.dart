import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:muchmelody/utils/utils.dart';
import '../utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);




  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}





class _AddPostScreenState extends State<AddPostScreen> {
Uint8List? _file;

_selectImage(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Select Image From'),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20.0),
              child: Text('Take a photo'),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.camera);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20.0),
                child: Text('Chose from gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ),
          ],
        );
      });
}


_selectGif(BuildContext context) async {


}

_selectMusic(BuildContext context) async {

  
}



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
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // user Profile picture
              CircleAvatar(
                maxRadius: 50.0,
                backgroundImage: NetworkImage(
                    'https://portalpopline.com.br/wp-content/uploads/2022/05/obi-wan-kenobi-2.jpg'),
              ),
              //TextField input
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(20, 255, 255, 255),
                    hintText: 'Write Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
// chose music , gif , image
          Container(
            height: 62.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  color: Colors.black,
                  onPressed: () {},
                  icon: Icon(Icons.music_note, size: 35.0),
                ),
                SizedBox(width: 90),
                IconButton(
                  color: Colors.black,
                  onPressed: () {},
                  icon: Icon(Icons.gif_box_outlined, size: 35.0),
                ),
                SizedBox(width: 90),
                IconButton(
                  color: Colors.black,
                  onPressed: () {
                    _selectImage(context);
                  },
                  icon: Icon(Icons.image_outlined, size: 35.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
// ready to post element
          SizedBox(
            height: 400,
            width: 400,
            child: AspectRatio(
              aspectRatio: 487 / 451,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(width: 2),
                  color: Color.fromARGB(255, 0, 0, 0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://i0.wp.com/hipertextual.com/wp-content/uploads/2020/01/hipertextual-star-wars-deseo-mas-grande-darth-vader-podria-hacerse-realidad-muy-pronto-2020659163.jpg'),
                    fit: BoxFit.cover,
                    alignment: FractionalOffset.topCenter,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

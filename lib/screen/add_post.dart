import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:muchmelody/models/user.dart';
import 'package:muchmelody/providers/user_provider.dart';
import 'package:muchmelody/resources/firestore_methods.dart';
import 'package:muchmelody/utils/utils.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();
  bool _isLoading = false;

  void postImage(
    String uid,
    String username,
    String profileImage,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      String res = await FirestoreMethods().uploadPost(
          _descriptionController.text, _file!, uid, username, profileImage);
      if (res == 'success') {
        setState(() {
          _isLoading = false;
        });

        showSnackBar('Posted', context);
        clearImage();
      } else {
        setState(() {
          _isLoading = false;
        });
        showSnackBar(res, context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  _selectImage(BuildContext context) async {
    return showDialog(
      barrierColor: Color.fromARGB(90, 255, 255, 255),
      context: context,
      builder: (context) {
        return SimpleDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          title:
              Text('Select File From', style: TextStyle(color: Colors.black)),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Take a photo',
                style: TextStyle(color: Colors.black),
              ),
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
              child: Text('Chose from gallery',
                  style: TextStyle(color: Colors.black)),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.gallery);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20.0),
              child: Text('Cancel', style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MelodyUser user = Provider.of<UserProvider>(context).getUser;

    return _file == null
        ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1538819137474-ffa0ee381af6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1336&q=80',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Stack(
                children: [
                  IconButton(
                    iconSize: 50.5,
                    alignment: Alignment.center,
                    icon: const Icon(
                      Icons.add_circle_outline,
                    ),
                    onPressed: () => _selectImage(context),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: clearImage,
              ),
              title: const Text('Add Post '),
              centerTitle: false,
              actions: [
                TextButton(
                  onPressed: () =>
                      postImage(user.uid, user.username, user.photoUrl),
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
                _isLoading
                    ? const LinearProgressIndicator()
                    : const Padding(
                        padding: EdgeInsets.only(top: 0),
                      ),
                const Divider(),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // user Profile picture
                    // CircleAvatar(
                    //   maxRadius: 50.0,
                    //   backgroundImage: NetworkImage(
                    //       'https://portalpopline.com.br/wp-content/uploads/2022/05/obi-wan-kenobi-2.jpg'),
                    // ),
                    //TextField input
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        controller: _descriptionController,
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
                  height: 200,
                  width: 200,
                  child: AspectRatio(
                    aspectRatio: 487 / 451,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 2),
                        color: Color.fromARGB(255, 0, 0, 0),
                        image: DecorationImage(
                          image: MemoryImage(_file!),
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

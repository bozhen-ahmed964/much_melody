import 'package:flutter/material.dart';

import '../utils/colors.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
       
        centerTitle: false,
        title: Text('Edit Profile'),
      ),
      body: Center(child:Text('Profile'),),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:muchmelody/resources/auth_methods.dart';
import 'package:muchmelody/screen/login.dart';
import 'package:muchmelody/utils/colors.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text('Settings'),
      ),
     
    );
  }
}

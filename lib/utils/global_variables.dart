import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muchmelody/screen/add_post.dart';
import 'package:muchmelody/screen/feed_screen.dart';
import 'package:muchmelody/screen/search_screen.dart';

import '../screen/profile_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('notification '),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:muchmelody/utils/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridFeedScreen extends StatefulWidget {
  GridFeedScreen({Key? key}) : super(key: key);

  @override
  State<GridFeedScreen> createState() => _GridFeedScreenState();
}

class _GridFeedScreenState extends State<GridFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text('Grid View'),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('post').get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // this staggered_grid_view is not working here
          //
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
            ),
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => Image.network(
                (snapshot.data! as dynamic).docs[index]['postUrl'], fit: BoxFit.cover),
          );
        },
      ),
    );
  }
}

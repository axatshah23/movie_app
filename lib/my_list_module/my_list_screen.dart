import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/my_list_module/show_my_list.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,

        /// Logo here
        leading: const Center(
          child: Text(
            'N',
            style: TextStyle(
              fontSize: 24.0,
              color: kAppThemeRed,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: const Text(
          'My List',
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Perform search action
            },
            icon: const Icon(
              IconlyLight.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ShowMyList(),
    );
  }
}

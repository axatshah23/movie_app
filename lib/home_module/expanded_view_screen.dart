import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/constants.dart';

import '../widgets/poster_card.dart';

class ExpandedViewScreen extends StatefulWidget {
  const ExpandedViewScreen(
      {Key? key, required this.title, required this.content})
      : super(key: key);
  final String title;
  final List<Map<String, String>> content;

  @override
  State<ExpandedViewScreen> createState() => _ExpandedViewScreenState();
}

class _ExpandedViewScreenState extends State<ExpandedViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            IconlyLight.arrowLeft,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.title,
          style: kHomeModuleAppBarTitleTextStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(
                IconlyLight.search,
                color: Colors.black,
              ),
              onPressed: () {
                // TODO: Add search functionality
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: GridView.builder(
          itemCount: widget.content.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (BuildContext context, int index) {
            return PosterCard(
              image: widget.content.elementAt(index)['poster']!,
              rating: widget.content.elementAt(index)['rating']!,
              height: 250,
              width: 150,
              borderRadius: 16.0,
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/home_module/expanded_view_screen.dart';

import '../../constants.dart';
import '../../widgets/poster_card.dart';

class FeaturedView extends StatefulWidget {
  const FeaturedView({Key? key, required this.title, required this.content})
      : super(key: key);
  final String title;
  final List<Map<String, String>> content;

  @override
  State<FeaturedView> createState() => _FeaturedViewState();
}

class _FeaturedViewState extends State<FeaturedView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
      child: Column(
        children: [
          /// Title and See all button in a row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Title
              Text(
                widget.title,
                style: kHomeScreenFeaturedViewTitleTextStyle,
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              /// TextButton - See All
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExpandedViewScreen(
                          title: widget.title,
                          content: widget.content,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'See all',
                    style: kHomeScreenFeaturedViewTextButtonTextStyle,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.content.length,
              itemBuilder: (context, index) {
                return PosterCard(
                  image: widget.content.elementAt(index)['poster']!,
                  rating: widget.content.elementAt(index)['rating']!,
                  height: 200,
                  width: 150,
                  borderRadius: 8.0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

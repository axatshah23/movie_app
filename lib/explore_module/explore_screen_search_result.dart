import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

import '../database.dart';
import '../widgets/poster_card.dart';

class SearchResultsListView extends StatelessWidget {
  final String searchTerm;
  final List<String> filters;

  const SearchResultsListView({
    Key? key,
    required this.searchTerm,
    required this.filters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (searchTerm == "" && filters.isEmpty)
        // Here the default or initial explore screen body will come
        ? GridView.builder(
            itemCount: shows.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (BuildContext context, int index) {
              return PosterCard(
                image: shows.elementAt(index)['poster']!,
                rating: shows.elementAt(index)['rating']!,
                height: 200,
                width: 140,
                borderRadius: 16.0,
                title: shows.elementAt(index)['title']!,
              );
            },
          )
        // Here the searched and filtered result will be displayed
        // Currently displaying an error image when something is searched
        // TODO: Find a way to display a result screen based on searched and filtered item after connecting database
        : SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Filters on top
                Visibility(
                  visible: filters.isNotEmpty,
                  child: SizedBox(
                    height: 45.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filters.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 4.0, left: 6.0),
                          child: Chip(
                            label: Text(
                              filters.elementAt(index),
                            ),
                            labelStyle: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            labelPadding: const EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 16.0),
                            backgroundColor: kAppThemeRed,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1.5,
                                color: kAppThemeRed,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),

                GridView.builder(
                  itemCount: movies.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return PosterCard(
                      image: movies.elementAt(index)['poster']!,
                      rating: movies.elementAt(index)['rating']!,
                      height: 250,
                      width: 150,
                      borderRadius: 16.0,
                      title: movies.elementAt(index)['title']!,
                    );
                  },
                )
              ],
            ),
          );
  }
}

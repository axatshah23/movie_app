import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:movie_app/database.dart';
import 'package:movie_app/explore_module/components/my_bottom_sheet.dart';

import '../constants.dart';
import 'explore_screen_search_result.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

// Here I have in-corporate a search bar. In its basic state it will show a normal view and once any modification are made via filter or search modified view will be shown.
class _ExploreState extends State<Explore> {
  // The length of past searches available for users to see
  static const historyLength = 5;

  // List to store past searches
  final List<String> _searchHistory = [];

  // Final sorted list that will be displayed
  late List<String> filteredSearchHistory;

  // The selected list of categories and filters to pass to next page
  List selectedFilters = [];

  // A method that will add newly searched items to list and sort list in proper order
  List<String> filterSearchTerms({
    required String? filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  // Method to add a search term to past list
  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }

    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  // Method to delete search term from history
  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  // Method to put the new search term first
  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  late FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /// The search bar
        body: FloatingSearchBar(
          controller: controller,
          border: const BorderSide(
            width: kSearchBarBorderWidth,
            color: kSearchBarBorderColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
          margins: const EdgeInsets.all(8.0),

          /// Search Button
          leadingActions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                IconlyLight.search,
                color: kSearchBarIconColor,
              ),
            )
          ],
          transition: CircularFloatingSearchBarTransition(),
          physics: const BouncingScrollPhysics(),

          /// What to show on search bar
          title: Text(
            searchedTerm == "" ? 'Search' : searchedTerm,
            style: kSearchBarTextStyle,
          ),

          /// What to show on search bar when selected and empty
          hint: 'What are you looking for?',
          hintStyle: kSearchBarHintTextStyle,
          queryStyle: kSearchBarQueryTextStyle,

          /// Filters Button
          actions: [
            IconButton(
              onPressed: () {
                /// Bottom Sheet that pops up when filter button is pressed
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const MyBottomSheet(),
                );
              },
              icon: const Icon(
                IconlyBold.filter,
                color: kSearchBarIconColor,
              ),
            )
          ],
          onQueryChanged: (query) {
            setState(() {
              filteredSearchHistory = filterSearchTerms(filter: query);
            });
          },
          onSubmitted: (query) {
            setState(() {
              addSearchTerm(query);
              searchedTerm = query;
            });
            controller.close();
          },

          /// The search result space and history space
          builder: (context, transition) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Material(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: kAppThemeRed),
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 4,
                child: Builder(
                  builder: (context) {
                    if (filteredSearchHistory.isEmpty &&
                        controller.query.isEmpty) {
                      return Container();
                    } else if (filteredSearchHistory.isEmpty) {
                      return ListTile(
                        title: Text(controller.query),
                        //tileColor: kAppThemeRed,
                        leading: const Icon(
                          IconlyLight.search,
                          color: kAppThemeRed,
                        ),
                        onTap: () {
                          setState(() {
                            addSearchTerm(controller.query);
                            searchedTerm = controller.query;
                          });
                          controller.close();
                        },
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: filteredSearchHistory
                            .map(
                              (term) => ListTile(
                                title: Text(
                                  term,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: kAppThemeRed,
                                  ),
                                ),
                                leading: const Icon(
                                  Icons.history,
                                  color: kAppThemeRed,
                                ),
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.clear,
                                    color: kAppThemeRed,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      deleteSearchTerm(term);
                                    });
                                  },
                                ),
                                onTap: () {
                                  setState(() {
                                    putSearchTermFirst(term);
                                    searchedTerm = term;
                                  });
                                  controller.close();
                                },
                              ),
                            )
                            .toList(),
                      );
                    }
                  },
                ),
              ),
            );
          },

          /// The main explore screen
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 64.0, 8.0, 0.0),
            child: SearchResultsListView(
              searchTerm: searchedTerm,
              filters: selectedListFinal,
            ),
          ),
        ),
      ),
    );
  }
}

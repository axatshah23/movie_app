import 'package:flutter/material.dart';
import 'package:movie_app/database.dart';

import '../constants.dart';
import '../widgets/poster_card.dart';

class ShowMyList extends StatefulWidget {
  const ShowMyList({Key? key}) : super(key: key);

  @override
  State<ShowMyList> createState() => _ShowMyListState();
}

class _ShowMyListState extends State<ShowMyList> {
  @override
  Widget build(BuildContext context) {
    return myList.isEmpty
        ? Center(
            child: Image.asset('assets/images/emptyList.JPG'),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Filters on top
                  choiceChipWidget(category),
                  const SizedBox(height: 8.0),

                  GridView.builder(
                    itemCount: myList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return PosterCard(
                        image: myList.elementAt(index)['poster']!,
                        rating: myList.elementAt(index)['rating']!,
                        height: 250,
                        width: 150,
                        borderRadius: 16.0,
                        title: myList.elementAt(index)['title']!,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
  }
}

class choiceChipWidget extends StatefulWidget {
  final List<String> reportList;

  const choiceChipWidget(this.reportList);

  @override
  _choiceChipWidgetState createState() => new _choiceChipWidgetState();
}

class _choiceChipWidgetState extends State<choiceChipWidget> {
  String selectedChoice = "All";

  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in widget.reportList) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          labelStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: item == selectedChoice ? Colors.white : kAppThemeRed,
          ),
          labelPadding:
              const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1.5,
              color: kAppThemeRed,
            ),
            borderRadius: BorderRadius.circular(100.0),
          ),
          backgroundColor: Colors.white,
          selectedColor: kAppThemeRed,
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      ));
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _buildChoiceList(),
      ),
    );
  }
}

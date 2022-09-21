import 'package:flutter/material.dart';
import 'package:movie_app/widgets/custom_bottom_navbar.dart';

import '../../constants.dart';
import '../../database.dart';
import '../../widgets/bottom_modal_sheet_buttons.dart';
import '../../widgets/bottom_modal_sheet_heading.dart';
import 'filter_bars.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.pop(context);
      },
      child: GestureDetector(
        onTap: () {},
        child: DraggableScrollableSheet(
          initialChildSize: 0.9,
          maxChildSize: 0.9,
          minChildSize: 0.3,
          builder: (_, controller) => Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
            ),
            child: ListView(
              controller: controller,
              shrinkWrap: true,
              children: [
                /// Heading
                const CustomHeading(
                  heading: 'Sort & Filter',
                ),

                /// Filter Bars
                /// Category
                FilterBar(title: 'Category', chips: category),

                /// Regions
                FilterBar(title: 'Regions', chips: region),

                /// Genre
                FilterBar(title: 'Genre', chips: genre),

                /// Time/Periods
                FilterBar(title: 'Time/Periods', chips: timePeriods),

                /// Sort
                FilterBar(title: 'Sort', chips: sort),

                /// Divider
                Center(
                  child: Container(
                    height: 1,
                    width: 325.0,
                    margin: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),

                /// Buttons

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Reset
                    BottomSheetButtons(
                      label: 'Reset',
                      backgroundColor: kAppThemeRedLight,
                      labelColor: kAppThemeRed,
                      onTap: () {
                        setState(() {
                          selectedListCurrent = [];
                          selectedListFinal = [];
                          print(selectedListCurrent);
                          print(selectedListFinal);
                          Navigator.pop(context);
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => const MyBottomSheet(),
                          );
                        });
                      },
                    ),

                    /// Apply
                    BottomSheetButtons(
                      label: 'Apply',
                      backgroundColor: kAppThemeRed,
                      labelColor: Colors.white,
                      onTap: () {
                        for (var element in selectedListCurrent) {
                          selectedListFinal.contains(element)
                              ? selectedListFinal.remove(element)
                              : selectedListFinal.add(element);
                        }
                        selectedListCurrent = [];
                        print(selectedListCurrent);
                        print(selectedListFinal);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomBottomNavBar(
                              currIndex: 1,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/explore_module/components/custom_chips.dart';

import '../../constants.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({
    Key? key,
    required this.title,
    required this.chips,
  }) : super(key: key);
  final String title;
  final List<String> chips;

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Title
          Text(
            widget.title,
            style: kFilterBarTitleTextStyle,
          ),
          const SizedBox(height: 8.0),

          /// Chips
          Container(
            height: 35.0,
            margin: const EdgeInsets.only(top: 8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.chips.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CustomChips(label: widget.chips.elementAt(index));
              },
            ),
          ),
        ],
      ),
    );
  }
}

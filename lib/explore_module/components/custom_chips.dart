import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../database.dart';

class CustomChips extends StatefulWidget {
  const CustomChips({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  State<CustomChips> createState() => _CustomChipsState();
}

class _CustomChipsState extends State<CustomChips> {
  late Color chipLabelColor;
  late Color chipBackgroundColor;

  @override
  void initState() {
    chipLabelColor =
        selectedListFinal.contains(widget.label) ? Colors.white : kAppThemeRed;
    chipBackgroundColor =
        selectedListFinal.contains(widget.label) ? kAppThemeRed : Colors.white;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Color temp = chipLabelColor;
          chipLabelColor = chipBackgroundColor;
          chipBackgroundColor = temp;
        });

        // // Add or remove item to selected list
        // selectedListFinal.contains(widget.label)
        //     ? selectedListFinal.remove(widget.label)
        //     : selectedListFinal.add(widget.label);

        // Add or remove item from selected list copy
        selectedListCurrent.contains(widget.label)
            ? selectedListCurrent.remove(widget.label)
            : selectedListCurrent.add(widget.label);
        print(selectedListCurrent);
        print(selectedListFinal);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 6.0),
        child: Chip(
          label: Text(
            widget.label,
          ),
          labelStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: chipLabelColor,
          ),
          backgroundColor: chipBackgroundColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1.5,
              color: kAppThemeRed,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}

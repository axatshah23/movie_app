import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class Interest_Chip extends StatelessWidget {
  String name;
  bool toggle;
  Interest_Chip({required this.name, required this.toggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
          color: toggle ? kPrimaryColor : Colors.white,
          border: Border.all(color: kPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(30)
      ),
      child: Text(
        name,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          color: toggle ? Colors.white : kPrimaryColor,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {

  String name;
  IconData icondata;
  Color colors;

  SignInButton({required this.name, required this.icondata, required this.colors});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(
              icondata,
              color: colors,
            ),
          ),
          Text('Continue with $name'),
        ],
      ),
    );
  }
}

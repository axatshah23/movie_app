import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class MailandMobileCard extends StatelessWidget {
  // const MailandMobileCard({Key? key}) : super(key: key);

  String type, value;
  IconData icondata;
  MailandMobileCard({required this.type, required this.value, required this.icondata});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        // setState((){
        //
        // });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.7),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20.0),
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: kLightPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icondata,
                size: 30,
                color: kPrimaryColor,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'via $type:',
                  style: TextStyle(
                    color: Color(0xff757575),
                    fontFamily: "Urbanist",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: height*0.01,
                ),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Urbanist",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

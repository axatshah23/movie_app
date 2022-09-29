import 'package:flutter/material.dart';
import 'package:movie_app/Account_setup_module/components/interest_chip.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/lists.dart';

class Interest_selection extends StatefulWidget {
  const Interest_selection({Key? key}) : super(key: key);

  @override
  State<Interest_selection> createState() => _Interest_selectionState();
}

class _Interest_selectionState extends State<Interest_selection> {
  Map<String, bool> toggleChip = {};
  List<String> interestList = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/');
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Choose your Interest',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15.0),
            child: ListView(
              children: [
                Text(
                  'Choose your interests and get the best movie recommendations. Don\'t worry, you can always change it later.',
                  maxLines: 4,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Wrap(
                  spacing: 12.0,
                  runSpacing: 12.0,
                  children: [
                    for (String item in Interests)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (toggleChip[item] == null) {
                              toggleChip[item] = false;
                            }
                            toggleChip[item] = !(toggleChip[item] ?? false);
                            toggleChip
                                .removeWhere((key, value) => value == false);
                            interestList = toggleChip.keys.toList();
                          });
                          print(interestList);
                        },
                        child: Interest_Chip(
                          name: item,
                          toggle: toggleChip[item] ?? false,
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.09),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: height * 0.02,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPrimary: Color(0x000000),
                    primary: kLightPrimaryColor,
                    padding: EdgeInsets.zero,
                    elevation: 0.0,
                    fixedSize: Size(width * 0.45, height * 0.07),
                  ),
                  child: Center(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text(
                        'Select atleast 3 Interests!',
                        textAlign: TextAlign.center,
                      ),
                    );
                    if (interestList.length >= 3) {
                      Navigator.pushNamed(context, '/Profile');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPrimary: Color(0x000000),
                    primary: kPrimaryColor,
                    padding: EdgeInsets.zero,
                    elevation: 0.0,
                    fixedSize: Size(width * 0.45, height * 0.07),
                  ),
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

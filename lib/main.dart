import 'package:flutter/material.dart';

import 'constants.dart';
import 'widgets/custom_bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        textTheme: kAppFont,
      ),
      home: CustomBottomNavBar(
        currIndex: 0,
      ),
    );
  }
}

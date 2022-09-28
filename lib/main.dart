import 'package:flutter/material.dart';
import 'package:movie_app/provider/premimum_provider.dart';
import 'package:movie_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/custom_bottom_navbar.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => PremimumProvider()),
    ],
    child: MyApp(),
  ));
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
      themeMode: context.watch<ThemeProvider>().themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: CustomBottomNavBar(
        currIndex: 0,
      ),
    );
  }
}

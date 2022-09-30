import 'package:flutter/material.dart';
import 'package:movie_app/provider/premimum_provider.dart';
import 'package:movie_app/provider/theme_provider.dart';
import 'package:movie_app/widgets/custom_bottom_navbar.dart';
import 'package:provider/provider.dart';
import 'Account_setup_module/Create_Pin.dart';
import 'Account_setup_module/Interest_selection.dart';
import 'Account_setup_module/fingerprint.dart';
import 'Account_setup_module/updateProfile.dart';
import 'Download_module/Downloads.dart';
import 'Forget&Reset_Password/Newpassword.dart';
import 'Forget&Reset_Password/forgot_password.dart';
import 'Welcome.dart';
import 'auth_module/LetsYouInPage.dart';
import 'auth_module/SignIn_module/SignIn.dart';
import 'auth_module/SignUp_module/SignUp.dart';

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
      routes: {
        '/home': (context) => const LetsYouIn(),
        '/welcome': (context) => const Welcome(),
        '/signIn': (context) => const SignIn(),
        '/signUp': (context) => const SignUp(),
        '/Interest': (context) => const Interest_selection(),
        '/PinGeneration': (context) => const Create_Pin(),
        '/Profile': (context) => const updateProfile(),
        '/FingerPrint': (context) => const FingerPrint(),
        '/ForgotPassword': (context) => const ForgotPassword(),
        '/NewPassword': (context) => const NewPassword(),
        '/Downloads': (context) => const Downloads(),
        '/navBar': (context) => CustomBottomNavBar(currIndex: 0),
      },
      debugShowCheckedModeBanner: false,
      themeMode: context.watch<ThemeProvider>().themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: const Welcome(),
    );
  }
}

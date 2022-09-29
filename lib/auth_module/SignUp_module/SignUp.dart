import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movie_app/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  late FocusNode focusNode1, focusNode2;
  bool _passwordVisible = false;

  @override
  void initState() {
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode1.addListener(() {
      setState(() {});
    });
    focusNode2.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    RegExp passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    final emailvalidator = ValidationBuilder()
        .email('Enter Valid email address')
        .maxLength(50)
        .build();
    final passwordvalidator = ValidationBuilder()
        .regExp(passwordRegex, 'Enter valid password')
        .minLength(6)
        .maxLength(15)
        .build();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/splash.svg',
                height: height * 0.12,
              ),

              SizedBox(
                height: height * 0.05,
              ),
              Text(
                'Create Your Account',
                style: kSignUpHeadingTextStyle,
              ),

              /// TextField
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  focusNode: focusNode1,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    prefixIcon: const Icon(
                      MdiIcons.email,
                      size: 20,
                      color: Colors.black87,
                    ),
                    hintText: 'e-mail',
                    fillColor: focusNode1.hasFocus
                        ? Color.fromRGBO(226, 18, 33, 0.2)
                        : Colors.grey[200],
                    filled: true,
                  ),
                  validator: emailvalidator,
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  focusNode: focusNode2,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    prefixIcon: const Icon(
                      MdiIcons.lock,
                      size: 20,
                      color: Colors.black87,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          _passwordVisible = true;
                        });
                      },
                      onLongPressUp: () {
                        setState(() {
                          _passwordVisible = false;
                        });
                      },
                      child: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black87,
                      ),
                    ),
                    hintText: 'password',
                    fillColor: focusNode2.hasFocus
                        ? Color.fromRGBO(226, 18, 33, 0.2)
                        : Colors.grey[200],
                    filled: true,
                  ),
                  validator: passwordvalidator,
                ),
              ),

              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.all(kPrimaryColor),
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text('Remmber me'),
                ],
              ),

              SizedBox(
                height: height * 0.015,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/Interest');
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPrimary: Color(0x000000),
                  primary: kPrimaryColor,
                  padding: EdgeInsets.zero,
                  elevation: 5.0,
                  fixedSize: Size(width * 0.9, height * 0.07),
                  shadowColor: kPrimaryColor,
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(
                height: height * 0.04,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text('or continue with'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.3,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
                    child: Icon(
                      Icons.facebook,
                      size: 25.0,
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.3,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
                    child: Icon(
                      Icons.apple,
                      size: 25.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.3,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
                    child: SvgPicture.asset(
                      'assets/google.svg',
                      height: 25.0,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/signIn');
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

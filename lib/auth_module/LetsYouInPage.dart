import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movie_app/auth_module/componants/SignInButtons.dart';
import 'package:movie_app/constants.dart';

class LetsYouIn extends StatelessWidget {
  const LetsYouIn({Key? key}) : super(key: key);

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
            Navigator.popAndPushNamed(context, '/welcome');
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [

              Center(
                child: SvgPicture.asset(
                    'assets/letsyouin.svg',
                    height: height * 0.25,
                ),
              ),

              SizedBox(
                height: height * 0.01,
              ),
              Text(
                'Let\'s you in',
                style: kLetsYouInHeadingTextStyle,
              ),

              SizedBox(
                height: height * 0.03,
              ),
              SignInButton(name: 'Facebook', icondata: Icons.facebook, colors: Colors.blue,),
          Container(
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
                  child: SvgPicture.asset(
                      'assets/google.svg',
                    height: 22.0,
                  ),
                ),
                Text('Continue with Google'),
              ],
            ),
          ),
              SignInButton(name: 'Apple', icondata: Icons.apple, colors: Colors.black),


              SizedBox(
                height: height * 0.04,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 5.0,
                      endIndent: 15.0,
                      thickness: 1.0,
                    ),
                  ),
                  Container(
                    child: Text('or'),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 15.0,
                      endIndent: 5.0,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.05,
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/signIn');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
                    primary: Color(0x00000000),
                    padding: EdgeInsets.zero,
                    elevation: 7.0,
                    shadowColor: kPrimaryColor,
                  ),
                  child: Container(
                    width: width * 0.85,
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    decoration: BoxDecoration(
                      color: Color(0xffE21221),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Center(
                      child: Text(
                        'Sign in with password',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/signUp');
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color(0xffE21221),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/constants.dart';

class FingerPrint extends StatelessWidget {
  const FingerPrint({Key? key}) : super(key: key);

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
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Set your FingerPrint',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: 10.0, right: 10.0, bottom: 25.0, top: 35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    'Add a fingerprint to make your account more secure.',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SvgPicture.asset(
                  'assets/finger-print-icon.svg',
                  height: height * 0.3,
                  color: kPrimaryColor,
                ),
                // Image.asset(
                //     'assets/fingerprint-unscreen.gif',
                //     height: height*0.3,
                // ),
                Text(
                  'Please put your finger on the fingerprint scanner to get started.',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),

                Padding(padding: EdgeInsets.only(bottom: height * 0.09)),
                // SizedBox(
                //   height: 0.0,
                // ),
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
                    showDialogfun(context);
                    // Navigator.pushNamed(context, '/ForgotPassword');
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

showDialogfun(context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(Duration(seconds: 4), () {
          Navigator.popUntil(context, ModalRoute.withName('/welcome'));
          Navigator.pushNamed(context, '/navBar');
        });
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25.0),
              ),
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/pop-up.png',
                    height: MediaQuery.of(context).size.height * 0.2,
                    fit: BoxFit.fitHeight,
                  ),
                  Text(
                    'Congratulations!',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: kPrimaryColor,
                    ),
                  ),
                  Text(
                    'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SpinKitCircle(
                    color: Color(0xfff5535a),
                    duration: Duration(milliseconds: 1500),
                    size: MediaQuery.of(context).size.height * 0.08,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

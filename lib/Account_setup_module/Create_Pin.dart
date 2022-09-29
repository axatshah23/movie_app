import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants.dart';
import 'package:pinput/pinput.dart';

class Create_Pin extends StatefulWidget {
  const Create_Pin({Key? key}) : super(key: key);

  @override
  State<Create_Pin> createState() => _Create_PinState();
}

class _Create_PinState extends State<Create_Pin> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    const focusedBorderColor = kPrimaryColor;
    const fillColor = Color.fromRGBO(226, 18, 33, 0.1);
    const borderColor = kPrimaryColor;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

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
          'Create your PIN',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(
              //   height: height*0.02,
              // ),
              // Padding(padding: EdgeInsets.only(top: height*0.001),),
              Center(
                child: Text(
                  'Add a PIN number to make your account more secure.',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // SizedBox(
              //   height: height*0.25,
              // ),
              Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Directionality(
                        // Specify direction if desired
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          controller: pinController,
                          focusNode: focusNode,
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          listenForMultipleSmsOnAndroid: true,
                          defaultPinTheme: defaultPinTheme,
                          validator: (value) {
                            // return value == '2222' ? null : 'Pin is incorrect';
                            if (value == null || value.isEmpty) {
                              return 'Please enter PIN';
                            } else if (value.length < 4) {
                              return 'Please enter 4 Digit PIN';
                            }
                          },
                          onClipboardFound: (value) {
                            debugPrint('onClipboardFound: $value');
                            pinController.setText(value);
                          },
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          obscureText: true,
                          onCompleted: (pin) {
                            debugPrint('onCompleted: $pin');
                          },
                          onChanged: (value) {
                            debugPrint('onChanged: $value');
                          },
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 9),
                                width: 22,
                                height: 1,
                                color: focusedBorderColor,
                              ),
                            ],
                          ),
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: focusedBorderColor),
                            ),
                          ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: fillColor,
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(color: focusedBorderColor),
                            ),
                          ),
                          errorPinTheme: defaultPinTheme.copyBorderWith(
                            border: Border.all(color: Colors.redAccent),
                          ),
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () => formKey.currentState!.validate(),
                      //   child: Text('Validate'),
                      // ),
                    ],
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.only(bottom: height * 0.2))
            ],
          ),
          Positioned(
            bottom: height * 0.02,
            right: width * 0.05,
            left: width * 0.05,
            child: ElevatedButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, '/FingerPrint');
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                onPrimary: Color(0x000000),
                primary: kPrimaryColor,
                padding: EdgeInsets.zero,
                fixedSize: Size(width * 0.85, height * 0.07),
                elevation: 0.0,
                shadowColor: kPrimaryColor,
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

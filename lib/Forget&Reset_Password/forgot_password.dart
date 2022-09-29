import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movie_app/Forget&Reset_Password/components/Mail&Mobile_card.dart';
import 'package:movie_app/constants.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      /// AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Forgot Password',
          style: const TextStyle(
            color: Colors.black87,
          ),
        ),
      ),

      /// Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: SvgPicture.asset(
                'assets/Frame.svg',
                height: height*0.25,
              ),
            ),

            SizedBox(
              height: height*0.06,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const Text(
                "Select which contact details should we use to reset your password",
                style: TextStyle(
                  color: const Color(0xff212121),
                  fontSize: 18,
                  fontFamily: "Urbanist",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(
                height: height*0.03,
            ),

            /// SMS Services
            MailandMobileCard(type: "SMS", value: "+1 111 ******99", icondata: MdiIcons.chatProcessing),
            MailandMobileCard(type: "E-mail", value: "and***ley@yourdomain.com", icondata: MdiIcons.email),

            SizedBox(
              height: height*0.02,
            ),


            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/NewPassword');
              },
              child: Container(
                width: width*0.92,
                padding: const EdgeInsets.symmetric(horizontal: 130.0, vertical: 18.0),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: const Center(
                  child: const Text(
                    'Continue',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}

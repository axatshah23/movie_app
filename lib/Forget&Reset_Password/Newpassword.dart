import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movie_app/constants.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

  bool isChecked = false;
  late FocusNode focusNode1, focusNode2;

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
  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;

  @override
  Widget build(BuildContext context) {
    RegExp passwordRegex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    final passwordvalidator = ValidationBuilder()
        .regExp(passwordRegex, 'Enter valid password')
        .minLength(6)
        .maxLength(15)
        .build();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      /// AppBar
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
          'Create New Password',
          style: TextStyle(
            color: Colors.black87,
            fontFamily: "Urbanist",
          ),
        ),
      ),

      /// Body
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: SvgPicture.asset(
                    'assets/new_pass.svg',
                  ),
                ),
              ),
              SizedBox(
                height: height*0.05,
              ),
              Container(
                margin: EdgeInsets.only(left: 24.0),
                child: Text(
                  'Create Your New Password',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Urbanist",
                  ),
                ),
              ),
              SizedBox(
                height: height*0.01,
              ),

              /// Password
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  focusNode: focusNode1,
                  obscureText: !_passwordVisible1,
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
                          _passwordVisible1 = !_passwordVisible1;
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          _passwordVisible1 = true;
                        });
                      },
                      onLongPressUp: () {
                        setState(() {
                          _passwordVisible1 = false;
                        });
                      },
                      child: Icon(
                        _passwordVisible1
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black87,
                      ),
                    ),
                    hintText: 'password',
                    fillColor: focusNode1.hasFocus ? Color.fromRGBO(226, 18, 33, 0.2) : Colors.grey[200],
                    filled: true,
                  ),
                  validator: passwordvalidator,
                ),
              ),

              SizedBox(
                height: height*0.015,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  focusNode: focusNode2,
                  obscureText: !_passwordVisible2,
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
                          _passwordVisible2 = !_passwordVisible2;
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          _passwordVisible2 = true;
                        });
                      },
                      onLongPressUp: () {
                        setState(() {
                          _passwordVisible2 = false;
                        });
                      },
                      child: Icon(
                        _passwordVisible2
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black87,
                      ),
                    ),
                    hintText: 'password',
                    fillColor: focusNode2.hasFocus ? Color.fromRGBO(226, 18, 33, 0.2) : Colors.grey[200],
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
                  Text(
                      'Remmber me',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.042,
              ),


              /// Continue Button
              GestureDetector(
                onTap: (){
                    if (_formKey.currentState!.validate()) {
                      showDialogfunc(context);
                    }
                },
                child: Center(
                  child: Container(
                    width: width*0.92,
                    padding: EdgeInsets.symmetric(horizontal: 130.0, vertical: 18.0),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(25.0),
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
                ),
              ),

              SizedBox(
                height: height*0.01,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

showDialogfunc(context){
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        Future.delayed(Duration(seconds: 5), () {
          Navigator.of(context).popAndPushNamed('/signIn');
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
      }
  );
}

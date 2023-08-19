import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sabti/Screens/Login/components/background.dart';
import 'package:sabti/Screens/Signup/signup_screen.dart';
import 'package:sabti/Screens/falahhome/falah_home.dart';
import 'package:sabti/Screens/home/home_screen.dart';
import 'package:sabti/components/already_have_an_account_acheck.dart';
import 'package:sabti/components/rounded_button.dart';
import 'package:sabti/components/rounded_input_field.dart';
import 'package:sabti/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sabti/services/authservice.dart';

var email, password, token, role;

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "تسجيل الدخول",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/farmer.svg",
              height: size.height * 0.285,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "بريدك الالكتروني",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "تسجيل الدخول",
              fontSize: 20.0,
              press: () {
                AuthService().getinfo(token).then((val) {
                  var msg = val.data['msg'];
                });
                AuthService().login(email, password, role).then((val) {
                  if (val.data['success']) {
                    token = val.data['token'];
                    var role = val.data['role'];
                    Fluttertoast.showToast(
                      msg: 'Authenticated',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 22.0,
                    );
                    role == 'fallah'
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                AuthService().getinfo(token).then((val) {
                                  var msg = val.data['msg'];
                                });
                                return FalahHome(
                                    //name: val.data['msg'],
                                    );
                              },
                            ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                AuthService().getinfo(token).then((val) {
                                  var msg = val.data['msg'];
                                });
                                return HomeScreen(
                                  '${val.data['msg']}',
                                );
                              },
                            ),
                          );
                  }
                });
              },
            ),
            // RoundedButton(
            //   text: "Get info",
            //   fontSize: 20.0,
            //   press: () {
            //     AuthService().getinfo(token).then((val) {
            //       Fluttertoast.showToast(
            //         msg: val.data['msg'],
            //         toastLength: Toast.LENGTH_SHORT,
            //         gravity: ToastGravity.BOTTOM,
            //         timeInSecForIosWeb: 5,
            //         backgroundColor: Colors.green,
            //         textColor: Colors.white,
            //         fontSize: 22.0,
            //       );
            //     });
            //   },
            // ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

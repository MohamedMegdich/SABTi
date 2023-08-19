import 'package:flutter/material.dart';
import 'package:sabti/Screens/Login/login_screen.dart';
import 'package:sabti/Screens/Signup/signup_screen.dart';
import 'package:sabti/Screens/Welcome/components/background.dart';
import 'package:sabti/components/rounded_button.dart';
import 'package:sabti/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              //"WELCOME TO SABTi"
              "مرحبا بيك في صابتي",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/sabti_logo.png",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "تسجيل الدخول",
              fontSize: 20.0,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "سجل معنا",
              fontSize: 20.0,
              color: kPrimaryLightColor,
              textColor: Colors.black,
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

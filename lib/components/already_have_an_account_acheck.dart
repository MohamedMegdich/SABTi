import 'package:flutter/material.dart';
import 'package:sabti/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "سجل معنا" : "تسجيل الدخول",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          login ? "ليس لديك حساب؟ " : "  هل لديك حساب ؟  ",
          style: TextStyle(color: kPrimaryColor, fontSize: 20),
        ),
      ],
    );
  }
}

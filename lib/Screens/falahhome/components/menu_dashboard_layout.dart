import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sabti/screens/details/components/body.dart';

import '../../../constants.dart';

class SideMenuDashboard extends StatefulWidget {
  @override
  _SideMenuDashboardState createState() => _SideMenuDashboardState();
}

class _SideMenuDashboardState extends State<SideMenuDashboard> {
  bool isCollapsed = true;
  double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: <Widget>[
          Menu(context),
          Body(),
        ],
      ),
    );
  }

  Widget Menu(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Align(
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("حساب شخصي",
                  style: TextStyle(color: kTextColor, fontSize: 22)),
              SizedBox(
                height: 10,
              ),
              Text("كمانداتك",
                  style: TextStyle(color: kTextColor, fontSize: 22)),
              SizedBox(
                height: 10,
              ),
              Text("مسجلين", style: TextStyle(color: kTextColor, fontSize: 22)),
              SizedBox(
                height: 10,
              ),
              Text("نوتيفيكاسيونات",
                  style: TextStyle(color: kTextColor, fontSize: 22)),
            ],
          )),
    );
  }
}

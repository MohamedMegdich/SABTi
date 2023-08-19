import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sabti/components/my_bottom_nav_bar.dart';
import 'package:sabti/screens/home/components/body.dart';
import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  HomeScreen(this.name);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  Duration duration = const Duration(milliseconds: 300);

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
          Dashboard(context),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Dashboard(context) {
    return AnimatedPositioned(
      top: isCollapsed ? 0 : 0.1 * screenHeight,
      bottom: isCollapsed ? 0 : 0.1 * screenHeight,
      left: isCollapsed ? 0 : -0.2 * screenHeight,
      right: isCollapsed ? 0 : 0.2 * screenHeight,
      duration: duration,
      child: Scaffold(
        appBar: buildAppBar(),
        body: Body(),
        bottomNavigationBar: MyBottomNavBar(),
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

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {
          setState(() {
            isCollapsed = !isCollapsed;
          });
        },
      ),
    );
  }
}

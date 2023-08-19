import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../falahhome/components/header_with_seachbox.dart';
import '../falahhome/components/recomend_plants.dart';
import '../../models/product.dart';
import '../../constants.dart';
import 'components/addprod.dart';

class FalahHome extends StatefulWidget {
  @override
  _FalahHomeState createState() => _FalahHomeState();
}

class _FalahHomeState extends State<FalahHome> {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  Duration duration = const Duration(milliseconds: 300);
  final List<Product> prod = [];
  void addNew(
    String txtitle,
    double txprix,
    double txquantite,
    String tximage,
    String txlocation,
  ) {
    final newtx = Product(
      id: DateTime.now().toString(),
      title: txtitle,
      quantite: txquantite,
      image: tximage,
      prix: txprix,
      location: txlocation,
    );
    setState(() {
      prod.add(newtx);
    });
  }

  void startnewtran(BuildContext ctx) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProd(addNew)),
    );
  }

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
          Dashboard(context, prod),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Dashboard(context, prod) {
    Size size = MediaQuery.of(context).size;
    return AnimatedPositioned(
      top: isCollapsed ? 0 : 0.1 * screenHeight,
      bottom: isCollapsed ? 0 : 0.1 * screenHeight,
      left: isCollapsed ? 0 : -0.2 * screenHeight,
      right: isCollapsed ? 0 : 0.2 * screenHeight,
      duration: duration,
      child: Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderWithSearchBox(size: size),
              Row(
                children: [
                  SizedBox(
                    width: 180,
                    height: 0,
                  ),
                  // Text(
                  //   "صابتي",
                  //   style: TextStyle(
                  //       fontSize: 30, color: Theme.of(context).primaryColor),
                  // ),
                ],
              ),
              RecomendsPlants(prod),
              SizedBox(height: kDefaultPadding),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            left: kDefaultPadding * 2,
            right: kDefaultPadding * 2,
            bottom: kDefaultPadding,
          ),
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -10),
                blurRadius: 35,
                color: kPrimaryColor.withOpacity(0.38),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/add.svg",
                ),
                onPressed: () => startnewtran(context),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/user-icon.svg"),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
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
              Row(
                children: [
                  Icon(Icons.account_circle),
                  SizedBox(
                    width: 10,
                    height: 50,
                  ),
                  Text("حساب شخصي"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.crop),
                  SizedBox(
                    width: 10,
                    height: 50,
                  ),
                  Text("محصول"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.notifications),
                  SizedBox(
                    width: 10,
                    height: 50,
                  ),
                  Text("تنبيه"),
                ],
              ),
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

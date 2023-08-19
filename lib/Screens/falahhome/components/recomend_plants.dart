import 'package:flutter/material.dart';
import 'package:sabti/components/rounded_button.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../models/product.dart';
import '../../../storeLocator.dart';
import '../../details/details_screen.dart';

class RecomendsPlants extends StatelessWidget {
  final List<Product> transaction;
  RecomendsPlants(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: transaction.isEmpty
            ? Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    " فضاءالفلاح",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 50, color: Theme.of(context).primaryColor),
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/planet-earth.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  RoundedButton(
                      text: "إضافة صابة",
                      fontSize: 20.0,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return storeLocator();
                            },
                          ),
                        );
                      }),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  // ignore: deprecated_member_use
                  return FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 4,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                child: Image.asset(
                                  'assets/images/tomate.png',
                                  height: 250,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                right: 10,
                                child: Container(
                                  width: 300,
                                  color: Colors.black54,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 20),
                                  child: Text(
                                    '${transaction[index].title}',
                                    style: TextStyle(
                                        fontSize: 26, color: Colors.white),
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    SizedBox(width: 6),
                                    Text('${transaction[index].location}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.queue),
                                    SizedBox(width: 6),
                                    Text('${transaction[index].quantite}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'TND',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 6),
                                    Text('${transaction[index].prix}'),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: transaction.length,
              ));
  }
}
/* SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RecomendPlantCard(
            image: "assets/images/image_1.png",
            title: "طماطم",
            country: "المنستير",
            price: 1.5,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/images/img.png",
            title: "رمان",
            country: "سوسة",
            price: 3,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/images/image_2.png",
            title: "تفاح",
            country: "صفاقس",
            price: 4,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, title, country;
  final double price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: kPrimaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ); */
